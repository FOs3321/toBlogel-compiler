module ApplyExpr where

import Control.Monad.State
import Data.Bifunctor (second)
import Debug.Trace
import Spec

class ApplyExpression a where
  traverseExpr :: (DExpr -> State s (DExpr -> DExpr)) -> a -> State s a
  traverseExprS :: (DExpr -> State s (DExpr -> DExpr)) -> a -> State s a
  applyExpr :: (DExpr -> DExpr) -> a -> a

instance ApplyExpression DProgram where
  traverseExpr s (DProgram main funcs) = do
    main' <- traverseExpr s main
    funcs' <- mapM (traverseExpr s) funcs
    return $ DProgram main' funcs'

  traverseExprS s (DProgram main funcs) = do
    main' <- traverseExprS s main
    funcs' <- mapM (traverseExprS s) funcs
    return $ DProgram main' funcs'

  applyExpr f (DProgram main funcs) = DProgram (applyExpr f main) $ map (applyExpr f) funcs

instance ApplyExpression DMainDef where
  traverseExpr s (DMainDef fname stmts) = do
    stmts' <- mapM (traverseExpr s) stmts
    return $ DMainDef fname stmts'

  traverseExprS s (DMainDef fname stmts) = do
    stmts' <- mapM (traverseExprS s) stmts
    return $ DMainDef fname stmts'

  applyExpr f (DMainDef fname stmts) = DMainDef fname $ map (applyExpr f) stmts

instance ApplyExpression DFunDef where
  traverseExpr s (DFunDef arg expr) = do
    expr' <- traverseExpr s expr
    return $ DFunDef arg expr'

  traverseExprS s (DFunDef arg expr) = do
    expr' <- traverseExprS s expr
    return $ DFunDef arg expr'

  applyExpr f (DFunDef arg expr) = DFunDef arg $ applyExpr f expr

instance ApplyExpression DStatement where
  traverseExpr s (DLoopDef e sts) = do
    e' <- traverseExpr s e
    sts' <- mapM (traverseExpr s) sts
    return (DLoopDef e' sts')
  traverseExpr s (DIfDef e sts1 sts2) = do
    e' <- traverseExpr s e
    sts1' <- mapM (traverseExpr s) sts1
    sts2' <- mapM (traverseExpr s) sts2
    return (DIfDef e' sts1' sts2')
  traverseExpr s (DVarDef v e) = do
    e' <- traverseExpr s e
    return (DVarDef v e')
  traverseExpr s (DReturnDef v) = return $ DReturnDef v

  traverseExprS s (DLoopDef e sts) = do
    e' <- traverseExprS s e
    sts' <- mapM (traverseExprS s) sts
    return (DLoopDef e' sts')
  traverseExprS s (DIfDef e sts1 sts2) = do
    e' <- traverseExprS s e
    sts1' <- mapM (traverseExprS s) sts1
    sts2' <- mapM (traverseExprS s) sts2
    return (DIfDef e' sts1' sts2')
  traverseExprS s (DVarDef v e) = do
    e' <- traverseExprS s e
    return (DVarDef v e')
  traverseExprS s (DReturnDef v) = return $ DReturnDef v

  applyExpr f (DLoopDef e sts) = DLoopDef (applyExpr f e) (map (applyExpr f) sts)
  applyExpr f (DIfDef e sts1 sts2) = DIfDef (applyExpr f e) (map (applyExpr f) sts1) (map (applyExpr f) sts2)
  applyExpr f (DVarDef var e) = DVarDef var (applyExpr f e)
  applyExpr f (DReturnDef var) = DReturnDef var

instance ApplyExpression DExpr where
  traverseExpr fs (DIf e1 e2 e3 t) = do
    f <- fs (DIf e1 e2 e3 t)
    e1' <- traverseExpr fs e1
    e2' <- traverseExpr fs e2
    e3' <- traverseExpr fs e3
    return $ f $ DIf e1' e2' e3' t
  traverseExpr fs (DFunAp fun args t) = do
    f <- fs $ DFunAp fun args t
    args' <- mapM (traverseExpr fs) args
    return $ f $ DFunAp fun args' t
  traverseExpr fs (DCmprhnsnExp e s t) = do
    f <- fs (DCmprhnsnExp e s t)
    e' <- traverseExpr fs e
    return $ f (DCmprhnsnExp e' s t)
  traverseExpr fs (DAggr agg e gen ins t) = do
    f <- fs (DAggr agg e gen ins t)
    e' <- traverseExpr fs e
    return $ f (DAggr agg e' gen ins t)
  traverseExpr fs e = do
    f <- fs e
    return $ f e

  traverseExprS fs e@DCmprhnsnExp {} = do
    st <- get
    r <- traverseExpr fs e
    put st
    return r
  traverseExprS fs e = traverseExpr fs e

  applyExpr f (DIf e1 e2 e3 t) = f $ DIf (applyExpr f e1) (applyExpr f e2) (applyExpr f e3) t
  applyExpr f (DFunAp fun args t) = f $ DFunAp fun (map (applyExpr f) args) t
  applyExpr f (DCmprhnsnExp e s t) = f $ DCmprhnsnExp (applyExpr f e) (map (second (applyExpr f)) s) t
  applyExpr f (DAggr agg e gen ins t) = f $ DAggr agg (applyExpr f e) gen ins t
  applyExpr f e = f e
