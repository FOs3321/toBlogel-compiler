{-# LANGUAGE FlexibleContexts       #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}

module Spec where
import           Data.Char

data DProgram = DProgram DMainDef   [DFunDef ]  deriving (Show, Eq)
data DMainDef = DMainDef DFun  [DStatement ]  deriving (Show, Eq)
data DFunDef = DFunDef DVar  DExpr
               deriving (Show, Eq)

data DStatement = DLoopDef DExpr  [DStatement ] DType Int [DVar]
                |DIfDef DExpr [DStatement] [DStatement]
                |DVarDef  DVar  DExpr   DType
                |DReturnDef DVar  DType
                |DZip DVar DVar DVar

                |DFunAP DVar String DVar

                    deriving (Show, Eq)
--data DGenS =DGenS DVar DVar   deriving (Show, Eq)
data DExpr =
              DIf DExpr DExpr DExpr  DType
              |DCmprhnsnExp DExpr [(DVar,DExpr)]
              | DChoiceVID  [Int] DType
              | DFunAp DFun  [DExpr ] DType
              | DAggr DAgg DExpr DGen  [DIn ] DType
              | DVExp DVar DType
              | DCExp DConst  DType
              -- | DFunCall DFun DVar  DType
              | IfNone


              deriving (Show, Eq)
data DGen = DGenNvals DVar  DExpr  DType
          | DGenG DVar  DExpr  DType
          | DGenNvalsV DVar  DConst  DType
          | DGenGV DVar  DConst  DType deriving (Show, Eq)

data DIn =  DIn DVar  DExpr  DType deriving (Show, Eq)
data DFun = DFun String
            | DBinOp String

             deriving (Show, Eq)
data DVar = DVar String Int DType
          | DVarV String Int
          | DFunV String DVar
          | DLoop String Int
          | DVarNull

            deriving (Show, Eq)


--data DVarG = DVExp (DVar a) DType
--               | DFunCall (DFun a) (DField a) DType deriving (Show, Eq)

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
data DType  = DTInt  
             | DTBool
             | DTString
             | DTDouble
             | DTZip
             | None
               deriving (Show, Eq)

data DConst = DCInt Int  DType
               | DCBool Bool  DType
               | DCString String  DType
               | DCDouble Double  DType
               | DCAllV
               | DCEmpty
                 deriving (Show, Eq)




getFun :: DFun -> String
getFun (DFun str ) =str;
getFun (DBinOp str ) =str;

getTypeExpr::DExpr ->DType
getTypeExpr (DFunAp _ _ etype)  =etype;
getTypeExpr (DVExp _ etype)  = etype;

getTypeExpr (DAggr _ _ _ _ etype)  = etype;
getTypeExpr (DCExp _ etype )  = etype ;

getTypeExpr (DIf _ _ _ etype)=etype;
getTypeExpr (DChoiceVID _ etype) =etype;

getTypeVar::DVar ->DType
getTypeVar (DVar _  _ vtype )=vtype;
getTypeVar DVarV{}=DTBool;


getTypeC::DConst ->DType
getTypeC DCDouble{} =DTDouble ;
getTypeC DCBool {} = DTBool ;
getTypeC DCInt{} =DTInt ;
getTypeC DCString {} = DTString ;
getTypeC DCAllV{} =DTBool ;
getTypeC DCEmpty{} =DTBool ;

analizeExpr :: DExpr ->[DVar]
analizeExpr (DIf expr1 expr2 expr3 _)= analizeExpr expr1++analizeExpr expr2++analizeExpr expr3;
analizeExpr (DFunAp _ exprs _)  = concatMap analizeExpr  exprs;

analizeExpr (DVExp var _)  =if ( head $genVarName var) == '_' then []else [var];
analizeExpr (DCExp _ _)  =[];

--analizeExpr (DEmpty var _)  =[genVar var];
analizeExpr (DAggr _ _ gen ins _)   =analizeGen gen++concatMap  analizeIns ins;
analizeExpr (DChoiceVID _ _)  =[];


analizeGen :: DGen ->[DVar]

analizeGen (DGenG  _ expr _) =analizeExpr expr;
analizeGen(DGenNvals _ expr  _)=analizeExpr expr;
analizeGen _=[]

analizeIns :: DIn ->[DVar]
analizeIns (DIn _ expr _) =analizeExpr expr;

genVar ::DVar -> String
genVar (DVar str vNum _) = "g"++str++"_"++show vNum;
genVar DVarNull = "g";
genVar (DLoop str  i )= str++"_"++show i;
genVar (DVarV str vNum ) = "g"++str++"_"++show vNum;
--genVar (DPickVar str i )= str ++"_"++show i
genVarg (DVar str vNum _) =map toLower str++"_"++show vNum;
genVarg (DVarV str  vNum) =map toLower str++"_"++show vNum;
genVarName ::DVar -> String
genVarName (DVar str _ _) = map toLower str;
genVarName (DVarV str  _) = map toLower str;
genVarName (DFunV str  _) = map toLower str;

genTypeCapR :: DType ->String
genTypeCapR DTDouble = "D";
genTypeCapR DTBool = "Flag";
genTypeCapR None = error "errer:Type is no unsighn";
genTypeCapR _ = error "Unimplements::genTypeCapR  "
get1st ::(a,b,c) ->a
get1st (val1,_,_)=val1
get2nd ::(a,b,c) ->b
get2nd (_,val2,_)=val2
get3rd ::(a,b,c) ->c
get3rd (_,_,val3)=val3
lookup3                  :: (Eq c) => c -> [(a,b,c)] -> Maybe b
lookup3 _key []          =  Nothing
lookup3  key ((x,y,z):xys)
    | key == z          =  Just y
    | otherwise         =  lookup3 key xys
