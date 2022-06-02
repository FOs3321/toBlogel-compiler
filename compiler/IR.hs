module IR where

import ASTtoCode
import Spec

data IR = IR
  { name :: String,
    vertex :: IRStruct, -- vertex
    message :: IRMsg, -- message
    aggregator :: IRAgg, -- aggregator
    steps :: [IRStep] -- ssで分割したやつ
  }
  deriving (Eq, Show)

type IRStruct = [(String, DType)]

type IRAgg = [(String, DType, DExpr)]

type IRMsg = [(String, DType, DExpr)]

data IRStep
  = IRStep
      Int
      [DStatement]
      IRConditions --次のステップに移行する条件
      [DVar]
  deriving (Eq, Show)

data IRConditions
  = IRStpID Int
  | IRCExp DExpr
  | IRCExit
  | IRCUndefined
  deriving (Eq, Show)

stpNum :: IRStep -> Int
stpNum (IRStep n _ _ _) = n

showIR :: IR -> [Char]
showIR (IR name v msg agg steps) =
  "\n-----------------------------------------\n"
    ++ "-- name"
    ++ "\n-----------------------------------------\n"
    ++ show name
    ++ "\n-----------------------------------------\n"
    ++ "-- vertex"
    ++ "\n-----------------------------------------\n"
    ++ concatMap (('\n' :) . show) v
    ++ "\n-----------------------------------------\n"
    ++ "-- message"
    ++ "\n-----------------------------------------\n"
    ++ concatMap (('\n' :) . show) msg
    ++ "\n-----------------------------------------\n"
    ++ "-- aggregator"
    ++ "\n-----------------------------------------\n"
    ++ concatMap (('\n' :) . show) agg
    ++ "\n-----------------------------------------\n"
    ++ "-- Steps"
    ++ "\n-----------------------------------------\n"
    ++ strSteps
  where
    strSteps = concatMap f steps
    f (IRStep n sts conditions isSend) =
      "\n[step" ++ show n ++ "]"
        ++ codeGenSts sts
        ++ "\n"
        ++ "    "
        ++ show isSend
        ++ "\n"
        ++ "    (conditions   "
        ++ showC conditions
        ++ ")\n"

showC :: IRConditions -> String
showC (IRCExp expr) = codeGenExpr expr
showC s = show s
