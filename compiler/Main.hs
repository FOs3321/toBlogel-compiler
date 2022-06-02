module Main where

import ASTtoCode (codeGen)
import Control.Monad.State
import Data.String
import Debug.Trace
import GenBlogel (genBlogel)
import GenIR' (genIR)
import IR
import Lexer
import Parser
import Spec
import System.Environment (getArgs)
import System.IO
import Text.Groom
import Transform (transform)
import TypeChecker

main :: IO ()
main = do
  -- print $evalState test []
  ast <- testParser
  (ast2, _) <- testTypeCheck ast
  ast3 <- testTransform ast2
  ir <- testIR ast3
  testGenCode ir
  compile ir
  return ()

compile ir = do
  writeFile "./test.cpp" $ genBlogel ir "~/ipth" "~opth"

testParser :: IO DProgram
testParser = do
  [file] <- getArgs
  code <- readFile file
  let ast = case parse code of
        Right ast -> ast
        Left err -> error err
  testPrint "AST" ast
  testOutput "AST" ast
  return ast

testTypeCheck p = do
  let (ast', env) = typeCheckMain p
  testPrint "TypeChecked" ast'
  testOutput "TypeChecked" ast'
  return (ast', env)

testTransform p = do
  let ast = transform p
  -- testPrint "Transformed" ast
  -- testPrintCode "Transformed Code" ast
  testOutput "Transformed" ast
  return ast

testIR p = do
  let ir = genIR p
  putStr $ showIR ir
  return ir

testGenCode ir@(IR prog vtx msg agg steps) =
  writeFile ("./" ++ prog ++ "_tobgl.cpp") $ genBlogel ir "/fukushima/input/testgraph01" ("/fukushima/output/" ++ prog ++ "_tobgl")

testPrintCode :: String -> DProgram -> IO ()
testPrintCode name ast =
  putStr $
    "------" ++ name ++ "----------\n" ++ codeGen ast ++ "\n"

testPrint :: String -> DProgram -> IO ()
testPrint name ast =
  putStr $
    "------" ++ name ++ "----------\n" ++ groom ast ++ "\n"

testOutput :: String -> DProgram -> IO ()
testOutput name ast =
  writeFile ("./output/" ++ getName ast ++ "_" ++ name) (groom ast)
