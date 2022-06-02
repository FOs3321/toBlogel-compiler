module Inlining where

--import           Libraly
import Spec

-- import Language.Haskell.Extension (KnownExtension(UnliftedFFITypes))

inliningMain :: [DFunDef] -> [DStatement] -> [DStatement]
inliningMain funcs ast = addElseSts $inliningMain' ast []
  where
    inliningMain' _ast oldast
      | _ast == oldast = _ast
      | otherwise = inliningMain' newast _ast
      where
        newast = concatMap (analizeLSt funcs) _ast

addElseSts :: [DStatement] -> [DStatement]
addElseSts = map addElseSt
  where
    addElseSt (DVarDef var expr) = DVarDef var (addElseExpr expr var)
      where
        addElseExpr (DIf expr1 expr2 IfNone None) _var = DIf expr1 expr2 (DVExp _var None) None
        addElseExpr _expr _ = _expr
    addElseSt st = st

analizeLSt :: [DFunDef] -> DStatement -> [DStatement]
analizeLSt funcs (DVarDef var expr) = addSts ++ [DVarDef var expr']
  where
    (expr', addSts) = analizeLExpr funcs expr
analizeLSt funcs (DLoopDef expr statements) = [DLoopDef expr statements']
  where
    statements' = concatMap (analizeLSt funcs) statements
analizeLSt _ sT = [sT]

--(funName , ar)gcl
analizeLExpr :: [DFunDef] -> DExpr -> (DExpr, [DStatement])
analizeLExpr funcs (DVExp (DFunV funName var t) vtype) = (DVExp (newVar var) vtype, [st])
  where
    Just (expr', argfd) = lookupvarC funName funcs
    newfunName = funName ++ genVarName var ++ "Y"
    newVar DVar {} = DVar newfunName 0 None
    newVar DVarV {} = DVar newfunName 0 None
    expr'' = matchArg (argfd, var) expr'
    st = DVarDef (newVar var) expr''
analizeLExpr funcs (DFunAp funName exprs vtype) = (DFunAp funName exprs' vtype, sts)
  where
    (exprs', sts) = foldl (\(x, y) (x1, y1) -> (x ++ [x1], y ++ y1)) ([], []) $ map (analizeLExpr funcs) exprs
analizeLExpr funcs (DAggr agg expr gen din vtype) = (DAggr agg expr' gen' din vtype, stse ++ sts) -- !!
  where
    (gen', sts) = case gen of
      DGenG var1 _expr _vtype -> (DGenG var1 _expr' _vtype, sts')
        where
          (_expr', sts') = analizeLExpr funcs _expr
      DGenNvals var1 _expr _vtype -> (DGenNvals var1 _expr' _vtype, sts')
        where
          (_expr', sts') = analizeLExpr funcs _expr
      x -> (x, [])
    (expr', stse) = analizeLExpr funcs expr

{-
analizeLExpr funcs (DAggr agg expr gen  din vtype ) = (DAggr agg expr' gen'  (din++insp') vtype , stse++sts) -- !!
     where (gen', sts,insp')  =case gen of
                DGenG var1 _expr _vtype ->(DGenG var1  newExpr _vtype, sts',insp)
                        where (newExpr,insp,sts')=fun expr
                DGenNvals var1 _expr _vtype ->(DGenNvals var1  newExpr _vtype, sts',insp)
                    where (newExpr,insp,sts')=fun expr
                x -> (x,[],[])

           fun _expr =  (newExpr, insp, sts')
                where  ( _expr', sts') =analizeLExpr funcs _expr
                       (newExpr, insp) | null addins  = (_expr' , [])
                                      | otherwise = (DVExp (DVar "_v" 0 None) None  , addins)
                                        where
                                            addins =addIns _expr
                       addIns (DVExp(DVarV var int) _ )= [ DIn(DVar "_v" 0 None) (DVarV var int) None]
                       addIns _= []
           (expr', stse) =analizeLExpr funcs expr
-}

analizeLExpr funcs (DIf expr1 expr2 IfNone vtype) = (DIf expr1' expr2' IfNone vtype, sts)
  where
    ([expr1', expr2'], sts) = foldl (\(x, y) (x1, y1) -> (x ++ [x1], y ++ y1)) ([], []) $ map (analizeLExpr funcs) [expr1, expr2]
analizeLExpr funcs (DIf expr1 expr2 expr3 vtype) = (DIf expr1' expr2' expr3' vtype, sts)
  where
    ([expr1', expr2', expr3'], sts) = foldl (\(x, y) (x1, y1) -> (x ++ [x1], y ++ y1)) ([], []) $ map (analizeLExpr funcs) [expr1, expr2, expr3]
analizeLExpr funcs (DCmprhnsnExp expr1 varset dt) = (DCmprhnsnExp expr1' varset dt, sts)
  where
    (expr1', sts) = analizeLExpr funcs expr1
analizeLExpr _ expr = (expr, [])

matchArg :: (DVar, DVar) -> DExpr -> DExpr
matchArg vars (DCmprhnsnExp expr1 varset dt) = DCmprhnsnExp (matchArg vars expr1) varset dt
matchArg vars (DIf expr1 expr2 expr3 vtype) = DIf (matchArg vars expr1) (matchArg vars expr2) (matchArg vars expr3) vtype
matchArg vars (DFunAp fun exprs vtype) = DFunAp fun (map (matchArg vars) exprs) vtype
matchArg vars (DVExp (DFunV fun var t) vtype) = DVExp (DFunV fun (matchArgV vars var) t) vtype
matchArg vars (DVExp var vtype) = DVExp (matchArgV vars var) vtype
matchArg vars (DAggr agg expr gen ins vtype) = DAggr agg expr' gen' ins' vtype
  where
    expr' = matchArg vars expr
    gen' = case gen of
      DGenG var1 _expr _vtype -> DGenG (matchArgV vars var1) (matchArg vars _expr) _vtype
      DGenGV var1 con _vtype -> DGenGV (matchArgV vars var1) con _vtype
      DGenNvals var1 _expr _vtype -> DGenNvals (matchArgV vars var1) (matchArg vars _expr) _vtype
      DGenNvalsV var1 con _vtype -> DGenNvalsV (matchArgV vars var1) con _vtype
    ins' = map (\(DIn var1 _expr _vtype) -> DIn var1 (matchArg vars _expr) _vtype) ins
--    where matchArgIn (DIn var1 var2 _vtype) =DIn var1 (matchArgV vars var2) _vtype
--matchArg vars (DVExp (DFun fun var) vtype) = DFunCall fun (matchArgV vars var) vtype
matchArg _ expr = expr

matchArgV :: (DVar, DVar) -> DVar -> DVar
matchArgV (argfd, argcl) var
  | var == argfd = argcl
  | otherwise = var

lookupvarC :: String -> [DFunDef] -> Maybe (DExpr, DVar)
lookupvarC _key [] = error ("Inlining Error: No Implements  is  " ++ show _key)
--lookupvarC  key (DFunDef fun  var  expr   : xys) | key ==fun = Just (expr, var)
lookupvarC key (DFunDef (DFunV fun var ft) expr : xys)
  | key == fun = Just (expr, var)
  | otherwise = lookupvarC key xys

genFun :: DFun -> String
genFun (DBinOp str) = str
genFun (DFun str) = str

--[
--DFunDef (DFun "f") (DVar "X" 0 None) (DFunAp (DBinOp "/") [DFunAp (DBinOp "/") [DFunCall (DFun "Edges") (DVar "X" 0 None) None,DCExp (DCDouble 2.0 DTDouble) None] None,DFunCall (DFun "Vertexes") (DVar "X" 0 None) None] None),
--DFunDef (DFun "Vertexes") (DVar "X" 0 None) (DAggr DAggSum (DCExp (DCDouble 1.0 DTDouble) None) (DGenGV (DVar "u" 0 None) DCAllV None) [DIn (DVar "u" 0 None) (DVar "X" 0 None) None] None)]
