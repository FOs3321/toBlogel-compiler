module GenIR'(genIR) where
import IR
import Spec
import Debug.Trace
import Data.List
import Data.Ord (comparing)
import Control.Monad.State
import qualified Data.Map.Strict as M

type Map k v = M.Map k v

type IRState a = State IRState' a

data IRState' = IRState' { irsteps :: ([IRStep], StepState),
                           irmsg :: IRMsg,
                           iragg :: IRAgg
                         }

data StepState = StepState { snum :: Int,
                             sstmts :: [DStatement],
                             sconditons :: IRConditions,
                             ssendMsg :: [DVar],
                             susedVars :: Map Int [DVar]
                           }

initIRS :: IRState'
initIRS = IRState' { irsteps = ([], initSS 0), irmsg = [], iragg = [] }

initSS :: Int -> StepState
initSS n = StepState { snum = n,
                       sstmts = [],
                       sconditons = IRCUndefined,
                       ssendMsg = [],
                       susedVars = M.empty
                     }

resetSS :: StepState -> Int -> StepState
resetSS ss n = ss { snum = n,
                    sstmts = [],
                    sconditons = IRCUndefined,
                    ssendMsg = []
                  }

updateSS :: StepState -> IRState ()
updateSS ss = do
    st@IRState'{ irsteps = (x,_)} <- get
    put $ st {irsteps = (x, ss)}

mkStep' :: StepState -> (IRStep, StepState)
mkStep' ss = ( IRStep (snum ss) (reverse $ sstmts ss) (sconditons ss) (ssendMsg ss),
               resetSS ss (snum ss + 1)
             )

mkStep :: IRState IRStep
mkStep = do
    irst <- get
    let (stps, ss) = irsteps irst
        (newStep, newSS) = mkStep' ss
    updateSS newSS
    return newStep

getStepNum :: IRState Int
getStepNum = do
    (_, ss) <- gets irsteps
    return $ snum ss

addSendMsg :: [DVar] -> IRState ()
addSendMsg vars = do
    ss <- gets $ snd . irsteps
    let sm = ssendMsg ss
    updateSS ss { ssendMsg = nub (sm ++ vars) }

addSendMsgb :: [DVar] -> IRStep -> IRStep
addSendMsgb vars (IRStep x y z vs) = IRStep x y z $ vs `union` vars 

setIRConditions :: IRConditions -> IRStep -> IRStep
setIRConditions c (IRStep n sts _ vs) = IRStep n sts c vs

setStep :: IRConditions -> IRState ()
setStep c = do
    stp <- mkStep
    let stp' = setIRConditions c stp
    st@IRState'{irsteps=(stps, ss)} <- get
    put $ st { irsteps = (stp':stps, ss) }

sepStep :: IRState ()
sepStep = do
    x <- getStepNum
    setStep (IRStpID $ x + 1)

genIfConditions :: DExpr -> Int -> Int -> IRConditions 
genIfConditions c x y = IRCExp (DIf c (DCExp (DCInt x DTInt) DTInt) (DCExp (DCInt y DTInt) DTInt) DTInt)

addUsedVars :: Int -> [DVar] -> IRState ()
addUsedVars k vs = do 
    ss <- gets $ snd . irsteps
    let m = susedVars ss
    let newSet = case (M.lookup k m) of { 
                     Just xs -> xs `union` vs;                    
                     Nothing  -> vs;
                 }
    let newMap = M.insert k newSet m
    updateSS (ss{susedVars = newMap})

addMsg :: (String, DType, DExpr) -> IRState ()
addMsg msg = do
    st@IRState'{irmsg = msgs} <- get
    if msg `elem` msgs 
        then return ()
        else put $ st { irmsg = msg : msgs } 
    
    
addAgg :: (String, DType, DExpr) -> IRState ()
addAgg agg = do
    st@IRState'{iragg = aggs} <- get
    if agg `elem` aggs 
        then return ()
        else put $ st { iragg = agg : aggs}

addStep :: IRStep -> IRState ()
addStep stp = do
    st@IRState'{irsteps=(stps, ss)} <- get
    put $ st { irsteps = (stp:stps, ss) }

addSt :: DStatement -> IRState ()
addSt st = do
    irst <- get
    let (stps, ss) = irsteps irst
        sts = sstmts ss
        ss' = ss { sstmts = st : sts }
    put $ irst {irsteps = (stps, ss')}



genIR :: DProgram -> [DVar] -> IR
genIR p@(DProgram (DMainDef _ stmts) _) = genIR' (getName p) stmts

genIR' :: String -> [DStatement] -> [DVar] -> IR
genIR' pname stmts env = IR pname vertex message aggregator steps
    where
        -- vertex = genVertexStruct env
        vertex = []
        (steps, message, aggregator) = genSteps' stmts

genSteps' :: [DStatement] -> ([IRStep], IRMsg, IRAgg)
genSteps' stmts = trace ("\n\n\nUsed Vars\n" ++ (show $ susedVars ss) ++ "\n\n") (sortBy (comparing stpNum) stps, msg, agg)
    where
        IRState'{irsteps=(stps, ss), irmsg=msg, iragg=agg} = execState (st stmts) initIRS 
        st stmts = do {mapM_ genStep stmts; mkSendMs}

genStep :: DStatement -> IRState ()
genStep (DLoopDef conditions loopSts) = do
    st <- get
    bStp <- mkStep
    bn <- getStepNum
    mapM_ genStep loopSts
    lStp <- mkStep
    an <- getStepNum
    let c = genIfConditions conditions bn an
        bStp' = setIRConditions c bStp
        lStp' = setIRConditions c lStp
    addStep bStp'
    addStep lStp'

genStep retdef@DReturnDef{} = do
    addSt retdef
    setStep IRCExit

genStep vardef@(DVarDef var expr@(DAggr dagg aggExpr gen ins dtype)) = do
    case gen of
        DGenG vtx graph gtype -> do
            addAgg (getVarName var, dtype, expr)
            sepCond <- needSepStp vardef
            if sepCond
                then do sepStep
                        addSt vardef
                else addSt vardef
        DGenNvals vtx graph gtype -> do
            addMsg (getVarName var, dtype, expr)
            sepCond <- needSepStp vardef
            if sepCond
                then do sepStep
                        k <- getStepNum
                        addUsedVars k (sendMs ins)
                        addSt vardef
                else do k <- getStepNum
                        addUsedVars k (sendMs ins)
                        addSt vardef 
    
genStep vardef@(DVarDef var expr) = addSt vardef

mkSendMs :: IRState ()
mkSendMs = do
    st@IRState'{ irsteps = (stps,ss)} <- get
    stps' <- mapM mkSendMs' stps
    put st { irsteps = (stps',ss) }

mkSendMs' :: IRStep -> IRState IRStep
mkSendMs' (IRStep n stmts c _) = do
    ms <- getSendMs c
    return $ IRStep n stmts c ms

getSendMs :: IRConditions -> IRState [DVar]
getSendMs (IRStpID x) = getUsedVars x
getSendMs (IRCExp e) = do
    let aux1 (DIf _ a b _) =  (aux2 a, aux2 b)
        aux1 e = error "failed getSendMs" 
        aux2 (DCExp (DCInt i DTInt) DTInt) = i
        aux2 e = error "invalid condition"
        (s1, s2) = aux1 e
    v1 <- getUsedVars s1
    v2 <- getUsedVars s2
    return $ v1 ++ v2

getSendMs (IRCExit) = return []
getSendMs (IRCUndefined) = error "faild genStep"

getUsedVars :: Int -> IRState [DVar]
getUsedVars n = do
    uv <- gets $ susedVars . snd . irsteps
    case M.lookup n uv of
        Just vs -> return vs 
        Nothing -> return []




sendMs :: [DIn] -> [DVar]
sendMs ins = map sndMs' ins
    where sndMs' (DIn _ (DVExp e _) _) = e

needSepStp :: DStatement -> IRState Bool
needSepStp stmt = do
    StepState{ sstmts=stmts } <- gets $ snd . irsteps
    return $ not $ null $ definedVars stmts `intersect` usedVars stmt

definedVars :: [DStatement] -> [DVar]
definedVars sts = nub $ concatMap getV $ filter isVD sts
    where getV (DVarDef var _ ) = [var]
          isVD DVarDef{} = True
          isVD _ = False

usedVars :: DStatement -> [DVar]
usedVars (DVarDef var expr) = nub $ usedVars' [] expr

usedVars' :: [DVar] -> DExpr -> [DVar]
usedVars' vars (DVExp var _) = var:vars
usedVars' vars (DFunAp _ exprs _) = vars ++ concatMap (usedVars' []) exprs
usedVars' vars (DCExp _ _) = vars
usedVars' vars (DIf e1 e2 e3 _) = vars ++ usedVars' [] e1 ++ usedVars' [] e2 ++ usedVars' [] e3
usedVars' vars (IfNone) = vars
usedVars' vars (DCmprhnsnExp e gen _) = vars ++ usedVars' [] e ++ concatMap ((usedVars' []) . snd) gen
usedVars' vars (DChoiceVID xs _) = vars
usedVars' vars (DAggr _ expr gen ins _) = vars ++ fg gen ++ concatMap fi ins

fg :: DGen -> [DVar]
fg (DGenNvals _ e _) = usedVars' [] e
fg (DGenG _ e _) = usedVars' [] e

fi :: DIn -> [DVar]
fi (DIn _ e _) = usedVars' [] e