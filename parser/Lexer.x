{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$upper = [A-Z]

tokens :-

    $white+                         ;
    "--".*                          ;
    $digit+                         { \s -> TokenInt (read s) }
    [1-9][0-9]* "." [0-9]+          { \s -> TokenDouble (read s) }
    "0."[0-9]+                      { \s -> TokenDouble (read s) }
    "True"                          { \s -> TokenBool (read s) }
    "False"                         { \s -> TokenBool (read s) }
    "V"                             { \_ -> TokenV }
    "("                             { \_ -> TokenLParen }
    ")"                             { \_ -> TokenRParen }
    "+"                             { \_ -> TokenPlus }
    "-"                             { \_ -> TokenMinus }
    "*"                             { \_ -> TokenMul }
    "/"                             { \_ -> TokenDev }
    "empty"                         { \_ -> TokenEmpty }
    "not"                           { \_ -> TokenNot }

    ">="                            { \s -> TokenBinOp s }
    "<="                            { \s -> TokenBinOp s } 
    ">"                             { \s -> TokenBinOp s }
    "<"                             { \s -> TokenBinOp s }
    "=="                            { \s -> TokenBinOp s }
    "!="                            { \s -> TokenBinOp s }


    $upper "'"*                     { \s -> TokenUpper s}
    $alpha [$alpha $digit \_ \"]*   { \s -> TokenString s}

{
data Token = TokenInt Int
           | TokenDouble Double
           | TokenBool Bool
           | TokenV
           | TokenEmpty
           | TokenLParen
           | TokenRParen
           | TokenPlus
           | TokenMinus
           | TokenMul
           | TokenDev
           | TokenUpper String
           | TokenString String
           | TokenBinOp String
           | TokenNot
           deriving (Eq,Show)
}