module TypeChecker where

import Control.Monad.State
import Debug.Trace
import Spec

type TypeEnv = ([(String, DType)], [Int]) --([(VarName, Var)], [scope stack])

class TypeCheckable a where
  typeCheck :: a -> State TypeEnv a

typeCheckMain :: DProgram -> (DProgram, TypeEnv)
typeCheckMain p = runState (typeCheck p) ([], [])

addEnv :: DVar -> State TypeEnv ()
addEnv v = do
  (env, s) <- get
  let s' = case s of
        [] -> []
        (h : t) -> h + 1 : t
  case lookup (getVarName v) env of
    Just t -> if t == getType v then return () else error "type error"
    Nothing -> put ((getVarName v, getType v) : env, s)
  return ()

pushEnv :: State TypeEnv ()
pushEnv =
  do
    (env, s) <- get
    put (env, 0 : s)

popEnv :: State TypeEnv ()
popEnv =
  do
    (env, s) <- get
    case s of
      (n : s') -> put (drop n env, s')
      _ -> error "err"

emptyEnv :: State TypeEnv TypeEnv
emptyEnv = do
  put ([], [])
  return ([], [])

typeCheckStmts :: [DStatement] -> State TypeEnv [DStatement]
typeCheckStmts stmts =
  do
    env <- get
    --    pushEnv
    stmts' <- mapM typeCheck stmts
    put env
    return stmts'

instance TypeCheckable DProgram where
  typeCheck (DProgram main funcs) = do
    initEnv
    funcs' <- mapM typeCheck funcs
    main' <- typeCheck main
    -- put []
    --
    return (DProgram main' funcs')

instance TypeCheckable DMainDef where
  typeCheck (DMainDef pname stmts) = do
    -- emptyEnv
    stmts' <- mapM typeCheck stmts
    return (DMainDef pname stmts')

instance TypeCheckable DFunDef where
  typeCheck (DFunDef (DFunV n p t) e) = do
    pushEnv
    addEnv p
    e' <- typeCheck e
    let v' = DFunV n p $ DTFun [] $ getType e'
    popEnv
    addEnv v'
    return (DFunDef v' e')
  typeCheck _ = error "err"

instance TypeCheckable DStatement where
  typeCheck (DVarDef v e) = do
    e' <- typeCheck e
    let v' = setType v $ getType e'
    addEnv v'
    return (DVarDef v' e')
  typeCheck (DLoopDef e stmts) = do
    e' <- typeCheck e
    if getType e' == DTBool
      then return ()
      else error "type error"
    stmts' <- typeCheckStmts stmts
    return (DLoopDef e' stmts')
  typeCheck (DIfDef e stmts1 stmts2) = do
    e' <- typeCheck e
    if getType e' == DTBool
      then return ()
      else error "type error"
    stmts1' <- typeCheckStmts stmts1
    stmts2' <- typeCheckStmts stmts2
    return (DIfDef e' stmts1' stmts2')
  typeCheck (DReturnDef v) = do
    v' <- typeCheck v
    return (DReturnDef v')

instance TypeCheckable DExpr where
  typeCheck (DCExp c _) = do
    c' <- typeCheck c
    return (DCExp c' $ getType c')
  typeCheck (DVExp v t) = do
    v' <- typeCheck v
    return (DVExp v' $ getType v')
  typeCheck (DFunAp f p t) = do
    (env, _) <- get
    p' <- mapM typeCheck p
    let fn = case f of
          DFun fn -> fn
          DBinOp fn -> fn
        (DTFun pt rt) = case lookup fn env of
          Just ft -> ft
          Nothing -> error $ "function " ++ fn ++ " is not defined."
    return (DFunAp f p' rt)
  typeCheck (DIf e1 e2 e3 _) = do
    e1' <- typeCheck e1
    e2' <- typeCheck e2
    e3' <- typeCheck e3
    case getType e1' of
      DTBool -> return ()
      _ -> error "type error"
    if getType e2' == getType e3'
      then return ()
      else error "type error"
    return (DIf e1' e2' e3' (getType e2'))
  typeCheck (DCmprhnsnExp e gen t) = do
    env <- get
    gen' <-
      mapM
        ( \(v, exp) -> do
            exp' <- typeCheck exp
            let v' = setType v $ getType exp'
            addEnv v'
            return (v', exp')
        )
        gen
    e' <- typeCheck e
    let t' = getType e'
    put env
    return (DCmprhnsnExp e' gen' t')
  typeCheck (DChoiceVID vids t) = do
    return (DChoiceVID vids DTBool)
  typeCheck (DAggr agg e gen ins t) = do
    env <- get
    gen' <- typeCheck gen
    ins' <- mapM typeCheck ins
    e' <- typeCheck e
    let t' = getType e'
    put env
    return (DAggr agg e' gen' ins' t')
  typeCheck e = return e

instance TypeCheckable DConst where
  typeCheck (DCInt c _) = return (DCInt c DTInt)
  typeCheck (DCBool c _) = return (DCBool c DTBool)
  typeCheck (DCDouble c _) = return (DCDouble c DTDouble)
  typeCheck (DCString c _) = return (DCString c DTString)
  typeCheck DCAllV = return DCAllV
  typeCheck DCEmpty = return DCEmpty

instance TypeCheckable DVar where
  typeCheck (DVar v i t) = do
    (env, _) <- get
    case lookup v env of
      Just t' -> return (DVar v i t')
      Nothing -> return (DVar v i t)
  typeCheck (DFunV s v t) = do
    (env, _) <- get
    case lookup s env of
      Just (DTFun [] t') -> return (DFunV s v t')
      Nothing -> error $ trace (foldl (\str e -> str ++ (show e ++ "\n")) "" env) ("function " ++ s ++ " is not defined.")
      _ -> error $ trace (foldl (\str e -> str ++ (show e ++ "\n")) "" env) "typecheck DVar err"
  typeCheck v@DVarV {} = return v
  typeCheck v = return v

instance TypeCheckable DGen where
  typeCheck (DGenNvals v e t) = do
    e' <- typeCheck e
    let t' = getType e'
        v' = setType v t'
    addEnv v'
    return (DGenNvals v' e' t')
  typeCheck (DGenG v e t) = do
    e' <- typeCheck e
    let t' = getType e'
        v' = setType v t'
    addEnv v'
    return (DGenG v' e' t')
  typeCheck g = return g

instance TypeCheckable DIn where
  typeCheck (DIn v e t) = do
    v' <- typeCheck v
    e' <- typeCheck e
    let t' = getType e'
    return (DIn v' e' t')

initEnv :: State TypeEnv ()
initEnv = do
  put
    ( [ ("||", DTFun [] DTBool),
        ("&&", DTFun [] DTBool),
        ("\\", DTFun [] DTBool),
        ("==", DTFun [] DTBool),
        ("!=", DTFun [] DTBool),
        ("not", DTFun [] DTBool),
        ("neg", DTFun [] DTBool),
        ("*", DTFun [] DTInt),
        ("-", DTFun [] DTInt),
        ("+", DTFun [] DTInt),
        ("/", DTFun [] DTDouble),
        ("<=", DTFun [] DTBool),
        ("<", DTFun [] DTBool),
        (">=", DTFun [] DTBool),
        (">", DTFun [] DTBool)
      ],
      []
    )
  return ()

-- ] expr3 '!!' expr3    { DFunAp (DBinOp "||") [$1, $3] None }
--         | expr3 '&&' expr3    { DFunAp (DBinOp "&&") [$1, $3] None }
--         | expr3 CMP expr3     { DFunAp (DBinOp $2) [$1, $3] None }
--         | expr3 '+' expr3     { DFunAp (DBinOp "+") [$1, $3] None }
--         | expr3 '-' expr3     { DFunAp (DBinOp "-") [$1, $3] None }
--         | expr3 '*' expr3     { DFunAp (DBinOp "*") [$1, $3] None }
--         | expr3 '/' expr3     { DFunAp (DBinOp "/") [$1, $3] None }
--         | expr2               { $1 }

-- expr2   : '-' expr1         { DFunAp (DFun "neg" ) [$2] None }
--         | 'not' expr1       { DFunAp (DFun "not" ) [$2] None }
--         | expr1             { $1 }