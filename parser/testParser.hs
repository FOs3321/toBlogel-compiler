module Main where
import Lexer
import Parser
import Spec

main :: IO ()
main = do
    p <- getContents
    let ast = parser (alexScanTokens p)
    print ast



