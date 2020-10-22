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
    "!!"                            { \_ -> TokenOr }
    "&&"                            { \_ -> TokenAnd }

    "{"                             { \_ -> TokenLCurly }
    "}"                             { \_ -> TokenRCurly }
    "["                             { \_ -> TokenLBrack }
    "]"                             { \_ -> TokenRBrack}

    "if"                            { \_ -> TokenIf }
    "then"                          { \_ -> TokenThen }
    "else"                          { \_ -> TokenElse }
    "while"                         { \_ -> TokenWhile }
    "return"                        { \_ -> TokenReturn }

    ";"                             { \_ -> TokenSemiColon }
    "="                             { \_ -> TokenEqual }


    ">=" | "<=" | ">" | "<" | "==" | "!="   { \s -> TokenCmp s }

    "minimum"                       { \_ -> TokenAggMin }
    "maximum"                       { \_ -> TokenAggMax }
    "sum"                           { \_ -> TokenAggSum }
    "prod"                          { \_ -> TokenAggProd }
    "and"                           { \_ -> TokenAggAnd }
    "or"                            { \_ -> TokenAggOr } 
    "<-"                            { \_ -> TokenLArrow }
    "in"                            { \_ -> TokenIn } 
    "nvals"                         { \_ -> TokenNvals }
    ","                             { \_ -> TokenComma }
    "|"                             { \_ -> TokenVbar }


    "<-" $white* "nvals" $white* "V"{ \_ -> TokenGenNvalsV }
    "<-" $white* "V"                { \_ -> TokenGenV }


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
           | TokenCmp String
           | TokenNot
           | TokenOr
           | TokenAnd
           | TokenLCurly
           | TokenRCurly
           | TokenIf
           | TokenThen
           | TokenElse
           | TokenWhile
           | TokenSemiColon
           | TokenEqual
           | TokenReturn
           | TokenAggMin
           | TokenAggMax
           | TokenAggSum
           | TokenAggProd 
           | TokenAggAnd
           | TokenAggOr
           | TokenLArrow 
           | TokenIn
           | TokenNvals
           | TokenComma
           | TokenLBrack
           | TokenRBrack
           | TokenVbar
           | TokenGenV
           | TokenGenNvalsV
           deriving (Eq,Show)
}