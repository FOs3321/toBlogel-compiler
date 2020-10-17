{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]


tokens :-

    $white+                         ;
    "--".*                          ;
    $digit+                         { \s -> TokenInt (read s) }
    "("                             { \_ -> TokenLParen }
    ")"                             { \_ -> TokenRParen }
    "+"                             { \_ -> TokenPlus }
    "-"                             { \_ -> TokenMinus }
    "*"                             { \_ -> TokenMul }
    "/"                             { \_ -> TokenDev }

{
data Token = TokenInt Int
           | TokenLParen
           | TokenRParen
           | TokenPlus
           | TokenMinus
           | TokenMul
           | TokenDev
           deriving (Eq,Show)
}