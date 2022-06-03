module Spec where

import Data.Char
import Data.List

data DProgram = DProgram DMainDef [DFunDef] deriving (Show, Eq)

data DMainDef = DMainDef DFun [DStatement] deriving (Show, Eq)

data DFunDef = DFunDef DVar DExpr deriving (Show, Eq)

data DStatement
  = DLoopDef DExpr [DStatement]
  | DIfDef DExpr [DStatement] [DStatement]
  | DVarDef DVar DExpr
  | DReturnDef DVar
  deriving (Show, Eq)

data DExpr
  = DFunAp DFun [DExpr] DType
  | DCExp DConst DType
  | DIf DExpr DExpr DExpr DType
  | IfNone
  | DCmprhnsnExp DExpr [(DVar, DExpr)] DType
  | DChoiceVID [Int] DType
  | DAggr DAgg DExpr DGen [DIn] DType
  | DVExp DVar DType
  deriving (Show, Eq)

data DFun
  = DFun String
  | DBinOp String
  deriving (Show, Eq)

data DVar
  = DVar String Int DType
  | DVarV String Int
  | DFunV String DVar DType
  | DLoop String Int
  | DVarNull
  deriving (Show, Eq)

data DGen
  = DGenNvals DVar DExpr DType
  | DGenG DVar DExpr DType
  | DGenNvalsV DVar DConst DType
  | DGenGV DVar DConst DType
  deriving (Show, Eq)

data DIn = DIn DVar DExpr DType deriving (Show, Eq)

data DField = DField String deriving (Show, Eq)

data DAgg
  = DAggMin
  | DAggMax
  | DAggSum
  | DAggProd
  | DAggAnd
  | DAggOr
  | DAggChoice
  deriving (Show, Eq)

data DConstructor = DConstructor String deriving (Show, Eq)

data DConst
  = DCInt Int DType
  | DCBool Bool DType
  | DCString String DType
  | DCDouble Double DType
  | DCAllV
  | DCEmpty
  deriving (Show, Eq)

data DType
  = DTInt
  | DTBool
  | DTString
  | DTDouble
  | DTZip
  | None
  | DTVar String
  | DTFun [DType] DType
  deriving (Show, Eq)

class Expression a where
  getType :: a -> DType

getName :: DProgram -> String
getName (DProgram (DMainDef (DFun pn) _) _) = pn

isNvals :: DExpr -> Bool
isNvals (DAggr _ _ (DGenNvals {}) _ _) = True
isNvals _ = False

getFun :: DFun -> String
getFun (DFun str) = str
getFun (DBinOp str) = str

instance Expression DExpr where
  getType (DFunAp _ _ t) = t
  getType (DVExp _ t) = t
  getType (DAggr _ _ _ _ t) = t
  getType (DCExp _ t) = t
  getType (DCmprhnsnExp _ _ t) = t
  getType (DIf _ _ _ t) = t
  getType (DChoiceVID _ t) = t

instance Expression DVar where
  getType (DVar _ _ t) = t
  getType DVarV {} = DTBool
  getType (DFunV _ _ t) = t

instance Expression DConst where
  getType DCDouble {} = DTDouble
  getType DCBool {} = DTBool
  getType DCInt {} = DTInt
  getType DCString {} = DTString
  getType DCAllV {} = DTBool
  getType DCEmpty {} = DTBool

setType :: DVar -> DType -> DVar
setType (DVar v i _) t = DVar v i t
setType (DFunV f p _) t = DFunV f p t
setType v@DVarV {} _ = v

analizeExpr :: DExpr -> [DVar]
analizeExpr (DIf expr1 expr2 expr3 _) = analizeExpr expr1 ++ analizeExpr expr2 ++ analizeExpr expr3
analizeExpr (DFunAp _ exprs _) = concatMap analizeExpr exprs
analizeExpr (DVExp var _) = if (head $genVarName var) == '_' then [] else [var]
analizeExpr (DCExp _ _) = []
--analizeExpr (DEmpty var _)  =[genVar var];
analizeExpr (DAggr _ _ gen ins _) = analizeGen gen ++ concatMap analizeIns ins
analizeExpr (DChoiceVID _ _) = []

analizeGen :: DGen -> [DVar]
analizeGen (DGenG _ expr _) = analizeExpr expr
analizeGen (DGenNvals _ expr _) = analizeExpr expr
analizeGen _ = []

analizeIns :: DIn -> [DVar]
analizeIns (DIn _ expr _) = analizeExpr expr

genVar :: DVar -> String
genVar (DVar str vNum _) = "g" ++ str ++ "_" ++ show vNum
genVar DVarNull = "g"
genVar (DLoop str i) = str ++ "_" ++ show i
genVar (DVarV str vNum) = "g" ++ str ++ "_" ++ show vNum

--genVar (DPickVar str i )= str ++"_"++show i
genVarg (DVar str vNum _) = map toLower str ++ "_" ++ show vNum
genVarg (DVarV str vNum) = map toLower str ++ "_" ++ show vNum

genVarName :: DVar -> String
genVarName (DVar str _ _) = map toLower str
genVarName (DVarV str _) = map toLower str
genVarName (DFunV str _ _) = map toLower str

getVarName :: DVar -> String
getVarName (DVar str _ _) = str
getVarName (DVarV str _) = str
getVarName (DFunV str _ _) = str

getAggName DAggMin = "min"
getAggName DAggMax = "max"
getAggName DAggSum = "sum"
getAggName DAggProd = "prod"
getAggName DAggAnd = "and"
getAggName DAggOr = "or"
getAggName DAggChoice = "chc"

strExpr (DFunAp func exprs t) = "fn" ++ strT t ++ getFun func ++ concatMap strExpr exprs
strExpr (DCExp const t) = "c" ++ strT t ++ show const
strExpr (DIf e1 e2 e3 t) = "if" ++ strT t ++ strExpr e1 ++ strExpr e2 ++ strExpr e3
strExpr (IfNone) = "n"
strExpr (DCmprhnsnExp e ins t) = "cm" ++ strT t ++ strExpr e ++ concatMap (strExpr . snd) ins
strExpr (DChoiceVID is t) = "cv" ++ strT t ++ concatMap show is
strExpr (DAggr agg e gen ins t) = "ag" ++ strT t ++ strExpr e ++ strGen gen ++ concatMap strIn ins
strExpr (DVExp v t) = getVarName v

strT DTInt = "i"
strT DTBool = "b"
strT DTDouble = "d"
strT DTString = "s"
strT None = "n"

strGen (DGenNvals _ e t) = strExpr e
strGen (DGenG _ e t) = strExpr e

strIn (DIn _ e _) = "_" ++ strExpr e

genTypeCapR :: DType -> String
genTypeCapR DTDouble = "D"
genTypeCapR DTBool = "Flag"
genTypeCapR None = error "errer:Type is no unsighn"
genTypeCapR _ = error "Unimplements::genTypeCapR  "

get1st :: (a, b, c) -> a
get1st (val1, _, _) = val1

get2nd :: (a, b, c) -> b
get2nd (_, val2, _) = val2

get3rd :: (a, b, c) -> c
get3rd (_, _, val3) = val3

lookup3 :: (Eq c) => c -> [(a, b, c)] -> Maybe b
lookup3 _key [] = Nothing
lookup3 key ((x, y, z) : xys)
  | key == z = Just y
  | otherwise = lookup3 key xys

dependedVars :: DExpr -> [DVar]
dependedVars e = nub $ dependedVars' e

dependedVars' :: DExpr -> [DVar]
dependedVars' (DAggr _ e gen ins _) = dependedVars' e ++ depGen gen ++ concatMap depIn ins
dependedVars' (DFunAp _ es _) = concatMap dependedVars' es
dependedVars' DCExp {} = []
dependedVars' (DIf e1 e2 e3 _) = dependedVars' e1 ++ dependedVars' e2 ++ dependedVars' e3
dependedVars' IfNone = []
dependedVars' (DCmprhnsnExp e ins _) = dependedVars' e ++ concatMap (dependedVars' . snd) ins
dependedVars' DChoiceVID {} = []
dependedVars' (DVExp v _) = [v]

depGen :: DGen -> [DVar]
depGen (DGenNvals _ e _) = dependedVars' e
depGen (DGenG _ e _) = dependedVars' e

depIn :: DIn -> [DVar]
depIn (DIn _ e _) = dependedVars' e

isAgg :: DExpr -> Bool
isAgg DAggr {} = True
isAgg _ = False
