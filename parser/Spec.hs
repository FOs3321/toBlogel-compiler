module Spec where

data DExpr = DFunAp DFun  [DExpr] DType
           | DCExp DConst  DType
             deriving (Show, Eq)

data DFun = DBinOp String 
            deriving (Show, Eq)

data DConst = DCInt Int  DType
              deriving (Show, Eq)

data DType  = DTInt  
              deriving (Show, Eq)
