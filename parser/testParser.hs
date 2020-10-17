module Main where
import Lexer
import Parser


main :: IO ()
main = do
    p <- getContents
    let ast = parser (alexScanTokens p)
    print ast



