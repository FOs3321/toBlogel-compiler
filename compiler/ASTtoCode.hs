module ASTtoCode where

import Data.List
import Spec

codeGen :: DProgram -> String
codeGen (DProgram mainDef funDef) =
  concatMap ("\n" ++) code
  where
    DMainDef (DFun mname) mainSts = mainDef
    mdef = mname ++ "() {"
    mSts = map ("    " ++) $ concatMap codeGenSt mainSts
    codeMain = [mdef] ++ mSts ++ ["}"]

    codeFunc = map codeGenFunc funDef
    code = codeMain ++ codeFunc

codeGenFunc :: DFunDef -> String
codeGenFunc f =
  let DFunDef (DFunV fname arg _) expr = f
      fdef = fname ++ "(" ++ getVarName arg ++ ") = "
   in fdef ++ codeGenExpr expr

codeGenSts :: [DStatement] -> String
codeGenSts sts = concatMap (("\n" ++) . ("    " ++)) $ concatMap codeGenSt sts

codeGenSt :: DStatement -> [String]
codeGenSt (DLoopDef condition sts) = [top] ++ codeSts ++ ["}"]
  where
    top = "while(" ++ codeGenExpr condition ++ "){"
    codeSts = map ("    " ++) $ concatMap codeGenSt sts
codeGenSt (DIfDef condition thenSts elseSts) = [top] ++ codeThen ++ [mid] ++ codeElse ++ ["}"]
  where
    top = "if(" ++ codeGenExpr condition ++ ") then {"
    mid = "} else {"
    codeThen = map ("    " ++) $ concatMap codeGenSt thenSts
    codeElse = map ("    " ++) $ concatMap codeGenSt elseSts
codeGenSt (DVarDef vname expr) = [getVarName vname ++ " = " ++ codeGenExpr expr ++ ";"]
codeGenSt (DReturnDef var) = ["return " ++ getVarName var ++ ";"]

-- codeGenSt _ = ["statements"]

codeGenExpr :: DExpr -> String
codeGenExpr (DFunAp (DBinOp op) [arg1, arg2] _) = codeGenExpr arg1 ++ " " ++ op ++ " " ++ codeGenExpr arg2
codeGenExpr (DFunAp (DFun op) args _) = op ++ "(" ++ intercalate ", " (map codeGenExpr args) ++ ")"
codeGenExpr (DVExp (DFunV f v _) _) = f ++ "(" ++ getVarName v ++ ")"
codeGenExpr (DVExp var _) = getVarName var
codeGenExpr (DCExp const _) =
  case const of
    DCInt v _ -> show v
    DCBool v _ -> show v
    DCString v _ -> show v
    DCDouble v _ -> show v
    DCAllV -> "V"
    DCEmpty -> "empty"
codeGenExpr (DIf cond thE IfNone _) = "if(" ++ e1 ++ ")then{" ++ e2 ++ "}"
  where
    e1 = codeGenExpr cond
    e2 = codeGenExpr thE
codeGenExpr (DIf cond thE elE _) = "if(" ++ e1 ++ ")then{" ++ e2 ++ "}else{" ++ e3 ++ "}"
  where
    e1 = codeGenExpr cond
    e2 = codeGenExpr thE
    e3 = codeGenExpr elE
codeGenExpr (DCmprhnsnExp expr ls _) = "{" ++ e ++ "|" ++ gen ++ "}"
  where
    e = codeGenExpr expr
    f (v, e) = "," ++ getVarName v ++ "<-" ++ codeGenExpr e
    gen = concatMap f ls
codeGenExpr (DAggr agg expr gen ins _) = ag ++ "[ " ++ e ++ "| " ++ bt ++ "]"
  where
    ag = case agg of
      DAggMin -> "minimum"
      DAggMax -> "maximum"
      DAggSum -> "sum"
      DAggProd -> "prod"
      DAggAnd -> "and"
      DAggOr -> "or"
      DAggChoice -> "choice"
    e = codeGenExpr expr
    g (DGenNvals v e1 _) = getVarName v ++ "<- nvals " ++ codeGenExpr e1
    g (DGenG v e1 _) = getVarName v ++ "<- " ++ codeGenExpr e1
    fi (DIn v e1 _) = ", " ++ getVarName v ++ " in " ++ codeGenExpr e1
    bt = g gen ++ concatMap fi ins
codeGenExpr x = show x

-- funDefs     : {- empty -}                       { [] }
--             | funDefs funDef                    { $2 : $1 }

-- funDef      : var '=' expr ';'                  { DFunDef $1 $3 }

-- mainDef     : fun '(' ')' '{' statements '}'    { DMainDef $1 (reverse $5) }

-- statements  : statement                         { [$1] }
--             | statements statement              { $2 : $1 }

-- statement : var '=' expr ';'                                                        { DVarDef $1 $3 None }
--           | 'if' '(' expr ')' 'then' '{' statements '}' 'else' '{' statements '}'   { DIfDef $3 (reverse $7) (reverse $11) }
--           | 'if' '(' expr ')' 'then' '{' statements '}'                             { DIfDef $3 (reverse $7) [] }
--           | 'while' '(' expr ')' '{' statements '}'                                 { DLoopDef $3 (reverse $6) None 0 [] }
--           | 'return' var ';'                                                        { DReturnDef $2 None }
