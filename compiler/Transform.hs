module Transform where
import Spec
import ApplyExpr

import Debug.Trace
import Data.Maybe
import Control.Monad.State
import Spec
import Inlining(inliningMain)
import ASTtoCode(codeGen)
import Debug.Trace
import Data.List
import Data.Function ( (&) )
import Spec (DProgram(DProgram))
import Text.Groom


transform :: DProgram -> DProgram
-- transform = rmCmprhnsn . removeAgg . seperateAgg . inlining . transIf . tfCmprhnsn . tfEmpty
transform = foldr ((.) . dbgtrace) id funcs
    where
        funcs = zip ["rmCmprhnsn", "removeAgg", "seperateAgg", "inlining", "transIf", "tfCmprhnsn", "tfEmpty"] [rmCmprhnsn, removeAgg, seperateAgg, inlining, transIf, tfCmprhnsn, tfEmpty]
        dbgtrace (fn, f) = \p -> let p' = f p in trace ("\n\n"++fn++"\n\n"++codeGen p') p'

 
inlining :: DProgram -> DProgram
inlining pp@(DProgram (DMainDef main stmts) funcs) = let p = DProgram (DMainDef main $ inliningMain funcs stmts) []
                                                  in trace ("\n\n"++groom pp ++"\n\n") p
tfEmpty :: DProgram -> DProgram
tfEmpty = applyExpr tfEmpty'

-- | e1 == Empty -> and[not v| v <- V, v in e1]
tfEmpty' :: DExpr -> DExpr
tfEmpty' (DFunAp (DBinOp "==") args dtype) =
    case args of
        [DCExp DCEmpty DTBool, e] -> emptyAgg e True
        [e, DCExp DCEmpty DTBool] -> emptyAgg e True
        _ -> DFunAp (DBinOp "==") args dtype
tfEmpty' (DFunAp (DBinOp "!=") args dtype) =
    case args of
        [DCExp DCEmpty DTBool, e] -> emptyAgg e False
        [e, DCExp DCEmpty DTBool] -> emptyAgg e False
        _ -> DFunAp (DBinOp "!=") args dtype

tfEmpty' e = e

emptyAgg :: DExpr -> Bool -> DExpr
emptyAgg e eq =
    let exprAgg = if eq
                  then DFunAp (DFun "not") [DVExp (DVar "v" 0 DTBool) DTBool] DTBool
                  else DVExp (DVar "v" 0 DTBool) DTBool
        gen = DGenG (DVar "v" 0 DTBool) (DCExp DCAllV DTBool) DTBool
        ins = [DIn (DVar "v" 0 DTBool) e DTBool]
        agg = if eq then DAggAnd else DAggOr
    in  DAggr agg exprAgg gen ins DTBool

rmCmprhnsn :: DProgram -> DProgram
rmCmprhnsn = applyExpr rmCmprhnsn'

rmCmprhnsn' :: DExpr -> DExpr
rmCmprhnsn' (DCmprhnsnExp expr _ _) = expr
rmCmprhnsn' expr = expr

-- | {NumDegs(A) <= theta } -> { deg <= theta | deg <- NumDegs(A)}
tfCmprhnsn :: DProgram -> DProgram
tfCmprhnsn p = evalState (traverseExprS tfCmprhnsnState p) []

tfCmprhnsnState :: DExpr -> State [(DVar, DExpr)] (DExpr -> DExpr)
tfCmprhnsnState (DCmprhnsnExp expr varset tp) = do
    st <- get
    put $ varset ++ st
    return $ tfCmprhnsn' st

tfCmprhnsnState e = do
    st <- get
    return $ tfCmprhnsn' st

tfCmprhnsn' :: [(DVar, DExpr)] -> DExpr ->  DExpr
tfCmprhnsn' [] (DCmprhnsnExp expr varset tp) = DCmprhnsnExp expr [] tp
-- tfCmprhnsn' True  [] (DCmprhnsnExp expr  varset _) = tfCmprhnsn' True varset expr
-- tfCmprhnsn' x DCmprhnsnExp{} = error "二重"
tfCmprhnsn' varset (DVExp var vtype) =
    case lookup var varset of
        Just e -> e
        Nothing -> DVExp var vtype

-- tfCmprhnsn' :: Bool -> [(DVar, DExpr)] -> DExpr -> DExpr
-- tfCmprhnsn' False [] (DCmprhnsnExp expr varset tp) = DCmprhnsnExp (tfCmprhnsn' False varset expr) [] tp
-- tfCmprhnsn' True  [] (DCmprhnsnExp expr  varset _) = tfCmprhnsn' True varset expr
-- tfCmprhnsn' _ x DCmprhnsnExp{} = error "二重"
-- tfCmprhnsn' flag varset (DVExp var vtype) = 
--     case lookup var varset of
--         Just e -> e
--         Nothing -> DVExp var vtype

-- tfCmprhnsn' varset (DAggr agg expr gen ins vtype) = DAggr agg newExpr' gen' (ins++insp') vtype
--       where  newExpr' = tfCmprhnsn' varset expr
--              newGen  (DGenG var1 _expr _vtype)  =   DGenG var1 (tfCmprhnsn' varset _expr) _vtype
--              newGen  (DGenNvals var1 _expr _vtype)  =   DGenNvals var1 (tfCmprhnsn' varset _expr) _vtype
--              newGen _gen =_gen
--              (gen', insp')  = case newGen gen of
--                         DGenG var1 _expr _vtype ->(DGenG var1  newExpr _vtype, insp)
--                                 where (newExpr,insp)=fun _expr
--                         DGenNvals var1 _expr _vtype ->(DGenNvals var1  newExpr _vtype, insp)
--                                 where (newExpr,insp)=fun _expr

--                         x -> (x,[])
--              fun _expr | null addins  =  (_expr , [])
--                        | otherwise =  (DVExp (DVar "_v" 0 None) None  , addins)
--                                           where
--                                               addins =addIns _expr
--              addIns (DVExp(DVarV var int) _ )= [ DIn(DVar "_v" 0 None) (DVExp(DVarV var int ) None)  None]
--              addIns _= []

tfCmprhnsn' _ e = e

applyStmts :: ([DStatement] -> [DStatement]) -> DProgram -> DProgram
applyStmts f (DProgram (DMainDef main stmts) funcs) = DProgram (DMainDef main $ f stmts) funcs

seperateAgg :: DProgram -> DProgram
seperateAgg = applyStmts $ concatMap sepAgg

removeAgg :: DProgram -> DProgram
removeAgg = applyStmts rmAgg

sepAgg :: DStatement -> [DStatement]
sepAgg (DLoopDef e sts) = let (defs,newE) = sepAgg' e
                              inLoop = concatMap sepAgg sts
                              newSt = DLoopDef newE (inLoop ++ defs)
                          in  defs ++ [newSt]

sepAgg (DIfDef e sts1 sts2) = let (defs,newE) = sepAgg' e
                                  newSt = DIfDef newE (concatMap sepAgg sts1) (concatMap sepAgg sts2)
                              in  defs ++ [newSt]
sepAgg (DVarDef var e) = [DVarDef var e]
sepAgg (DReturnDef var) = [DReturnDef var]

sepAgg' :: DExpr -> ([DStatement], DExpr)
sepAgg' aggE@(DAggr agg e gen ins dtype) = let (defs,newE) = sepAgg' e
                                               aggE' = DAggr agg newE gen ins dtype
                                               newDefs = defs ++ [DVarDef (DVar aggName 0 dtype) aggE']
                                               aggName = strExpr aggE
                                           in  (newDefs, DVExp (DVar aggName 0 dtype) dtype)

sepAgg' (DFunAp func es t) = let defs = concatMap (fst . sepAgg') es
                                 newF = DFunAp func (map (snd . sepAgg') es) t
                             in  (defs, newF)
sepAgg' e = ([],e)
-- sepAgg' (DCExp const _) = ([],"")
-- sepAgg' (DIf e1 e2 e3 _) = let (d1,v1) = sepAgg' e1 
--                                (d2,v2) = sepAgg' e2
--                                (d3,v3) = sepAgg' e3 
--                            in  
-- sepAgg' (IfNone) = ([],"")
-- sepAgg' (DCmprhnsnExp e _ _) = sepAgg' e
-- sepAgg' (DChoiceVID _ _ ) = sepAgg' e
-- sepAgg' (DVExp _ _) = ([],"")

rmAgg :: [DStatement] -> [DStatement]
rmAgg sts = sts'
      where sts' = rmAgg' [] sts

rmAgg' :: [DStatement] -> [DStatement] -> [DStatement]
rmAgg' rmvd [] = rmvd
rmAgg' rmvd (s@(DVarDef _ (DAggr agg e gen ins t)):ss) = rmAgg' (rmvd ++ [s]) ss'
      where
            dpnds = dependedVars (DAggr agg e gen ins t)
            ss'  = rmAggSt ss [ getVarName d | d <- dpnds] s
rmAgg' rmvd (s@(DLoopDef e lsts):ss) = rmAgg' (rmvd ++ [s']) ss
      where lsts' = rmAgg' [] lsts
            s' = DLoopDef e lsts'
rmAgg' rmvd (s:ss) = rmAgg' (rmvd ++ [s]) ss

rmAggSt :: [DStatement] -> [String] -> DStatement -> [DStatement]
rmAggSt (s@(DVarDef var _):ss) vars aggSt
      | getVarName var `elem` vars = s:ss
      | s == aggSt = rmAggSt ss vars aggSt
      | otherwise = s:rmAggSt ss vars aggSt

rmAggSt (s:ss) vars aggSt = s:rmAggSt ss vars aggSt

rmAggSt [] _ _ = []


transIf :: DProgram -> DProgram
transIf (DProgram (DMainDef main stmts) funcs) = DProgram (DMainDef main $ concatMap transIf' stmts) funcs

transIf':: DStatement ->[DStatement]
transIf' (DLoopDef expr sts) = [DLoopDef expr (sts >>= transIf')]

transIf' (DIfDef expr sts1 sts2) = ifSts
      where vars = nub $ concatMap getVars sts1 ++ concatMap getVars sts2
            ifSts = map mkSt vars
            mkSt  _var =DVarDef _var (mkexpr _var)
            mkexpr _var=DIf expr (lookup_expr _var $reverse sts1) (lookup_expr _var $reverse sts2)   (getType _var)

            getVars (DVarDef var _) = [var]
            getVars _ = []
            lookup_expr key [] = DVExp key (getType key)
            lookup_expr key (DVarDef var _expr : sts) | key == var = _expr
                                                      | otherwise = lookup_expr key sts
            lookup_expr key (_:sts) =  lookup_expr key sts
transIf' x =[x]