module Spec where

data DProgram = DProgram DMainDef   [DFunDef ]  deriving (Show, Eq)
data DMainDef = DMainDef DFun  [DStatement ]  deriving (Show, Eq)
data DFunDef = DFunDef DVar  DExpr  deriving (Show, Eq)

data DStatement = DLoopDef DExpr  [DStatement ] DType Int [DVar]
                | DIfDef DExpr [DStatement] [DStatement]
                | DVarDef  DVar  DExpr   DType
                | DReturnDef DVar  DType
                | DZip DVar DVar DVar
                | DFunAP DVar String DVar
                deriving (Show, Eq)

data DExpr  = DFunAp DFun  [DExpr ] DType
            | DCExp DConst  DType
            | DIf DExpr DExpr DExpr  DType
            | IfNone
            --  | DCmprhnsnExp DExpr [(DVar,DExpr)]
            --  | DChoiceVID  [Int] DType 
            --  | DAggr DAgg DExpr DGen  [DIn ] DType
            --  | DVExp DVar DType
            --  | DFunCall DFun DVar  DType
             
           deriving (Show, Eq)

data DFun   = DFun String
            | DBinOp String 
            deriving (Show, Eq)

data DVar = DVar String Int DType
          | DVarV String Int
          | DFunV String DVar
          | DLoop String Int
          | DVarNull
          deriving (Show, Eq)

data DGen = DGenNvals DVar  DExpr  DType
          | DGenG DVar  DExpr  DType
          | DGenNvalsV DVar  DConst  DType
          | DGenGV DVar  DConst  DType 
          deriving (Show, Eq)

data DIn =  DIn DVar  DExpr  DType deriving (Show, Eq)
data DField = DField String  deriving (Show, Eq)
data DAgg = DAggMin
             | DAggMax
             | DAggSum
             | DAggProd
             | DAggAnd
             | DAggOr
             | DAggChoice
             deriving (Show, Eq)

data DConstructor = DConstructor String  deriving (Show, Eq)


data DConst = DCInt Int  DType
            | DCBool Bool  DType
            | DCString String  DType
            | DCDouble Double  DType
            | DCAllV
            | DCEmpty
            deriving (Show, Eq)

data DType  = DTInt  
            | DTBool
            | DTString
            | DTDouble
            | DTZip
            | None
            deriving (Show, Eq)
