module GenIR (genIR) where

import Control.Monad.State
import Data.List
import Debug.Trace
import IR
import Spec
import Text.Groom

data StepState = StepState
  { stmts :: [DStatement],
    steps :: [IRStep],
    msg :: IRMsg,
    agg :: IRAgg,
    stepNum :: Int,
    isSend :: [DVar]
  }

genIR :: DProgram -> [DVar] -> IR
genIR p@(DProgram (DMainDef _ stmts) _) = genIR' (getName p) stmts

genIR' :: String -> [DStatement] -> [DVar] -> IR
genIR' pname stmts env = IR pname vertex message aggregator steps
  where
    vertex = genVertexStruct env
    (steps, message, aggregator) = genSteps' stmts

-- genSteps :: [DStatement] -> ([IRStep], IRStruct, IRStruct)
-- genSteps statements = foldl genStep steps statements
--     where steps = ([IRStep 0 [] 0], [], [])

genSteps' :: [DStatement] -> ([IRStep], IRMsg, IRAgg)
genSteps' stmts =
  let (_, stps, msg, agg, _, _) = foldl genStep' ([], [], [], [], 0, []) stmts
   in (reverse stps, msg, agg)

genStep' :: ([DStatement], [IRStep], IRMsg, IRAgg, Int, [DVar]) -> DStatement -> ([DStatement], [IRStep], IRMsg, IRAgg, Int, [DVar])
genStep' (sts, stps, msg, agg, i, _) retdef@DReturnDef {} = ([], newStps, msg, agg, i + 1, [])
  where
    newSts = reverse (retdef : sts)
    stpID = length stps
    newStps = IRStep stpID newSts IRCExit [] : stps
genStep' (sts, stps, msg, agg, i, isSend) ifdef@DIfDef {} = (ifdef : sts, stps, msg, agg, i, isSend)
genStep' (sts, stps, msg, agg, i, isSend) loop@(DLoopDef conditions loopSts) =
  ([], lstep : (loopSteps ++ stps), newMsg, newAgg, newi + 1, [])
  where
    (lsts, loopSteps, newMsg, newAgg, newi, isSendInLoop) = foldl genStep' ([], [stp], msg, agg, i + 1, []) loopSts
    -- lstpID = length loopSteps + length stps
    lstep = IRStep newi (reverse lsts) condExpr (isSendInLoop ++ checkIsSend loopSteps)
    stp = IRStep i (reverse sts) condExpr isSend
    condExpr = IRCExp (DIf conditions (DCExp (DCInt (i + 1) DTInt) DTInt) (DCExp (DCInt (newi + 1) DTInt) DTInt) DTInt)
genStep' (sts, stps, msg, agg, i, isSend) (vardef@(DVarDef vname expr)) =
  case expr of
    DAggr dagg aggExpr gen ins dtype ->
      case gen of
        DGenG vtx graph gtype ->
          if needSepStp sts vardef
            then
              let step = IRStep i (reverse sts) (IRStpID (i + 1)) isSend
                  newStps = step : stps
                  newAgg = (getVarName vname, dtype, expr)
                  newAggs = if newAgg `elem` agg then agg else newAgg : agg
               in ([vardef], newStps, msg, newAggs, i + 1, [])
            else
              let newAgg = (getVarName vname, dtype, expr)
                  newAggs = if newAgg `elem` agg then agg else newAgg : agg
               in ((vardef : sts), stps, msg, newAggs, i, isSend)
        DGenNvals vtx graph gtype ->
          let f (DCExp (DCDouble n DTDouble) DTDouble) = n == fromInteger (round n)
              f _ = False
              dtype' = if f aggExpr then DTInt else dtype
           in if needSepStp sts vardef
                then
                  let step = IRStep i (reverse sts) (IRStpID $ i + 1) (isSend ++ sendMs ins)
                      newStps = step : stps
                      newMsg = (getVarName vname, dtype', expr)
                      newMsgs = if newMsg `elem` msg then msg else newMsg : msg
                   in ([vardef], newStps, newMsgs, agg, i + 1, [])
                else
                  let newMsg = (getVarName vname, dtype', expr)
                      newMsgs = if newMsg `elem` msg then msg else newMsg : msg
                   in ((vardef : sts), isSendTrue (sendMs ins) stps, newMsgs, agg, i, isSend)
    _ -> ((vardef : sts), stps, msg, agg, i, isSend)

isSendTrue :: [DVar] -> [IRStep] -> [IRStep]
isSendTrue vname (step : t) = (IRStep i sts c (vs ++ vname)) : t
  where
    (IRStep i sts c vs) = step

checkIsSend :: [IRStep] -> [DVar]
checkIsSend steps = vs
  where
    (IRStep _ _ _ vs) = head $ reverse steps

sendMs :: [DIn] -> [DVar]
sendMs ins = map sndMs' ins
  where
    sndMs' (DIn _ (DVExp e _) _) = e

needSepStp :: [DStatement] -> DStatement -> Bool
needSepStp stp stmt = not $ null $ definedVars stp `intersect` usedVars stmt

definedVars :: [DStatement] -> [DVar]
definedVars sts = nub $ concatMap getV $ filter isVD sts
  where
    getV (DVarDef var _) = [var]
    isVD DVarDef {} = True
    isVD _ = False

usedVars :: DStatement -> [DVar]
usedVars (DVarDef var expr) = nub $ usedVars' [] expr

usedVars' :: [DVar] -> DExpr -> [DVar]
usedVars' vars (DVExp var _) = var : vars
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

-- genStep :: ([IRStep], IRStruct, IRStruct) -> DStatement -> ([IRStep], IRStruct, IRStruct)
-- genStep (steps, msg, agg) (vardef@(DVarDef vname expr vtype)) =
--     case expr of
--         DAggr agg aggExpr gen ins dtype ->
--             case gen of
--                 DGenG vtx graph gtype -> let i = length steps
--                                              step = IRStep i []
--                                          in ((step:steps), msg, (vname, vtype):agg)
--                 DGenNvals vtx graph gtype -> let i = length steps
--                                                  step = IRStep i [vardef] IRCTrue
--                                              in ((step:steps), (vname, vtype):msg, agg)
--         _ -> (setSts steps vardef, msg, agg)

-- genStep (steps, msg, agg) (loop@(DLoopDef condition loopSts dtype _ _)) = newSteps
--     where i = length steps
--           step = IRStep i [] IRCTrue
--           steps' = foldl genStep (step:steps) loopSts
--           newSteps = (IRStep (length steps') [] IRCTrue):steps'

-- genStep (steps, msg, agg) (ifdef@(DIfDef condition thenSts elseSts)) = (setSts steps ifdef, msg, agg)

-- genStep (steps, msg, agg) (retdef@DReturnDef{}) = (setSts steps retdef, msg, agg)

isAgg :: DExpr -> Bool
isAgg expr = case expr of
  DAggr {} -> True
  _ -> False

setSts :: [IRStep] -> DStatement -> [IRStep]
setSts ((IRStep i sts cond b) : steps) st = step : steps
  where
    step = IRStep i (sts ++ [st]) cond b

genVertexStruct :: [DVar] -> IRStruct
genVertexStruct env = map f env
  where
    f (DVar name _ dtype) = (name, dtype)
    f (DVarV name _) = (name, DTBool)

-- genMsgStruct :: [DStatement] -> IRStruct
-- genMsgStruct

-- genAggStruct :: [DStatement] -> IRStruct
