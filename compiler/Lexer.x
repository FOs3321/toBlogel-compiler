{
module Lexer where
}

%wrapper "monadUserState"

$digit = 0-9
$alpha = [a-zA-Z]
$upper = [A-Z]

tokens :-
  $white+                         ;
  "--".*                          ;
  "{-" * "-}"                     ;
  $digit+                         { mkTokenRead TokenInt }
  [1-9][0-9]* "." [0-9]+          { mkTokenRead TokenDouble }
  "0."[0-9]+                      { mkTokenRead TokenDouble }
  "True"                          { mkTokenRead TokenBool }
  "False"                         { mkTokenRead TokenBool }
  "V"                             { mkToken TokenV }
  "("                             { mkToken TokenLParen }
  ")"                             { mkToken TokenRParen }
  "+"                             { mkToken TokenPlus }
  "-"                             { mkToken TokenMinus }
  "*"                             { mkToken TokenMul }
  "/"                             { mkToken TokenDev }
  "empty"                         { mkToken TokenEmpty }
  "not"                           { mkToken TokenNot }
  "!!"                            { mkToken TokenOr }
  "&&"                            { mkToken TokenAnd }
  "\"                            { mkToken TokenDiff }

  "{"                             { mkToken TokenLCurly }
  "}"                             { mkToken TokenRCurly }
  "["                             { mkToken TokenLBrack }
  "]"                             { mkToken TokenRBrack}

  "if"                            { mkToken TokenIf }
  "then"                          { mkToken TokenThen }
  "else"                          { mkToken TokenElse }
  "while"                         { mkToken TokenWhile }
  "return"                        { mkToken TokenReturn }

  ";"                             { mkToken TokenSemiColon }
  "="                             { mkToken TokenEqual }


  ">=" | "<=" | ">" | "<" | "==" | "!="   { mkTokenStr TokenCmp }

  "minimum"                       { mkToken TokenAggMin }
  "maximum"                       { mkToken TokenAggMax }
  "sum"                           { mkToken TokenAggSum }
  "prod"                          { mkToken TokenAggProd }
  "and"                           { mkToken TokenAggAnd }
  "or"                            { mkToken TokenAggOr } 
  "<-"                            { mkToken TokenLArrow }
  "in"                            { mkToken TokenIn } 
  "nvals"                         { mkToken TokenNvals }
  ","                             { mkToken TokenComma }
  "|"                             { mkToken TokenVbar }


  $upper "'"*                     { mkTokenStr TokenUpper }
  $alpha [$alpha $digit \_ \"]*   { mkTokenStr TokenString }

{
data TokenData 
  = TokenInt Int
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
  | TokenDiff
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

data Token 
  = Token TokenData AlexPosn
  | Eof

data AlexUserState = AlexUserState{ scope :: Int }

alexInitUserState :: AlexUserState
alexInitUserState = AlexUserState { scope = 0 }

mkTokenRead :: Read a => (a -> TokenData) -> AlexInput -> Int -> Alex Token
mkTokenRead tk (pos,_,_,str) len = return $ Token (tk $ read tokenStr) pos
  where tokenStr = take len str

mkTokenStr :: (String -> TokenData) -> AlexInput -> Int -> Alex Token
mkTokenStr tk (pos,_,_,str) len = return $ Token (tk tokenStr) pos
  where tokenStr = take len str

mkToken :: TokenData -> AlexInput -> Int -> Alex Token
mkToken tk = mkTokenStr (\_ -> tk)

alexEOF :: Alex Token
alexEOF = return Eof
}