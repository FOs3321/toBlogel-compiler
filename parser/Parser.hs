{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import Spec
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,112) ([61440,39,64512,9,0,127,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1520,0,2556,0,95,0,0,0,0,0,2,0,0,40896,0,10224,0,2556,0,639,49152,159,61440,39,64512,9,0,31,49152,23,61440,0,0,0,0,0,768,0,192,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","expr","expr3","expr2","expr1","expr0","const","fvar","fun","var","INT","DOUBLE","BOOL","\"empty\"","'V'","\"not\"","'('","')'","'+'","'-'","'*'","'/'","CMP","\"!!\"","\"&&\"","UPPER","STRING","%eof"]
        bit_start = st * 30
        bit_end = (st + 1) * 30
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..29]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (13) = happyShift action_7
action_0 (14) = happyShift action_8
action_0 (15) = happyShift action_9
action_0 (16) = happyShift action_10
action_0 (17) = happyShift action_11
action_0 (18) = happyShift action_12
action_0 (19) = happyShift action_13
action_0 (22) = happyShift action_14
action_0 (4) = happyGoto action_15
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (9) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (13) = happyShift action_7
action_1 (14) = happyShift action_8
action_1 (15) = happyShift action_9
action_1 (16) = happyShift action_10
action_1 (17) = happyShift action_11
action_1 (18) = happyShift action_12
action_1 (19) = happyShift action_13
action_1 (22) = happyShift action_14
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (9) = happyGoto action_6
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (21) = happyShift action_19
action_2 (22) = happyShift action_20
action_2 (23) = happyShift action_21
action_2 (24) = happyShift action_22
action_2 (25) = happyShift action_23
action_2 (26) = happyShift action_24
action_2 (27) = happyShift action_25
action_2 _ = happyReduce_1

action_3 _ = happyReduce_9

action_4 _ = happyReduce_12

action_5 _ = happyReduce_13

action_6 _ = happyReduce_14

action_7 _ = happyReduce_16

action_8 _ = happyReduce_17

action_9 _ = happyReduce_18

action_10 _ = happyReduce_20

action_11 _ = happyReduce_19

action_12 (13) = happyShift action_7
action_12 (14) = happyShift action_8
action_12 (15) = happyShift action_9
action_12 (16) = happyShift action_10
action_12 (17) = happyShift action_11
action_12 (19) = happyShift action_13
action_12 (7) = happyGoto action_18
action_12 (8) = happyGoto action_5
action_12 (9) = happyGoto action_6
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (13) = happyShift action_7
action_13 (14) = happyShift action_8
action_13 (15) = happyShift action_9
action_13 (16) = happyShift action_10
action_13 (17) = happyShift action_11
action_13 (18) = happyShift action_12
action_13 (19) = happyShift action_13
action_13 (22) = happyShift action_14
action_13 (4) = happyGoto action_17
action_13 (5) = happyGoto action_2
action_13 (6) = happyGoto action_3
action_13 (7) = happyGoto action_4
action_13 (8) = happyGoto action_5
action_13 (9) = happyGoto action_6
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (13) = happyShift action_7
action_14 (14) = happyShift action_8
action_14 (15) = happyShift action_9
action_14 (16) = happyShift action_10
action_14 (17) = happyShift action_11
action_14 (19) = happyShift action_13
action_14 (7) = happyGoto action_16
action_14 (8) = happyGoto action_5
action_14 (9) = happyGoto action_6
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (30) = happyAccept
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_10

action_17 (20) = happyShift action_33
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_11

action_19 (13) = happyShift action_7
action_19 (14) = happyShift action_8
action_19 (15) = happyShift action_9
action_19 (16) = happyShift action_10
action_19 (17) = happyShift action_11
action_19 (18) = happyShift action_12
action_19 (19) = happyShift action_13
action_19 (22) = happyShift action_14
action_19 (5) = happyGoto action_32
action_19 (6) = happyGoto action_3
action_19 (7) = happyGoto action_4
action_19 (8) = happyGoto action_5
action_19 (9) = happyGoto action_6
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (13) = happyShift action_7
action_20 (14) = happyShift action_8
action_20 (15) = happyShift action_9
action_20 (16) = happyShift action_10
action_20 (17) = happyShift action_11
action_20 (18) = happyShift action_12
action_20 (19) = happyShift action_13
action_20 (22) = happyShift action_14
action_20 (5) = happyGoto action_31
action_20 (6) = happyGoto action_3
action_20 (7) = happyGoto action_4
action_20 (8) = happyGoto action_5
action_20 (9) = happyGoto action_6
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (13) = happyShift action_7
action_21 (14) = happyShift action_8
action_21 (15) = happyShift action_9
action_21 (16) = happyShift action_10
action_21 (17) = happyShift action_11
action_21 (18) = happyShift action_12
action_21 (19) = happyShift action_13
action_21 (22) = happyShift action_14
action_21 (5) = happyGoto action_30
action_21 (6) = happyGoto action_3
action_21 (7) = happyGoto action_4
action_21 (8) = happyGoto action_5
action_21 (9) = happyGoto action_6
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (13) = happyShift action_7
action_22 (14) = happyShift action_8
action_22 (15) = happyShift action_9
action_22 (16) = happyShift action_10
action_22 (17) = happyShift action_11
action_22 (18) = happyShift action_12
action_22 (19) = happyShift action_13
action_22 (22) = happyShift action_14
action_22 (5) = happyGoto action_29
action_22 (6) = happyGoto action_3
action_22 (7) = happyGoto action_4
action_22 (8) = happyGoto action_5
action_22 (9) = happyGoto action_6
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (13) = happyShift action_7
action_23 (14) = happyShift action_8
action_23 (15) = happyShift action_9
action_23 (16) = happyShift action_10
action_23 (17) = happyShift action_11
action_23 (18) = happyShift action_12
action_23 (19) = happyShift action_13
action_23 (22) = happyShift action_14
action_23 (5) = happyGoto action_28
action_23 (6) = happyGoto action_3
action_23 (7) = happyGoto action_4
action_23 (8) = happyGoto action_5
action_23 (9) = happyGoto action_6
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (13) = happyShift action_7
action_24 (14) = happyShift action_8
action_24 (15) = happyShift action_9
action_24 (16) = happyShift action_10
action_24 (17) = happyShift action_11
action_24 (18) = happyShift action_12
action_24 (19) = happyShift action_13
action_24 (22) = happyShift action_14
action_24 (5) = happyGoto action_27
action_24 (6) = happyGoto action_3
action_24 (7) = happyGoto action_4
action_24 (8) = happyGoto action_5
action_24 (9) = happyGoto action_6
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (13) = happyShift action_7
action_25 (14) = happyShift action_8
action_25 (15) = happyShift action_9
action_25 (16) = happyShift action_10
action_25 (17) = happyShift action_11
action_25 (18) = happyShift action_12
action_25 (19) = happyShift action_13
action_25 (22) = happyShift action_14
action_25 (5) = happyGoto action_26
action_25 (6) = happyGoto action_3
action_25 (7) = happyGoto action_4
action_25 (8) = happyGoto action_5
action_25 (9) = happyGoto action_6
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (21) = happyShift action_19
action_26 (22) = happyShift action_20
action_26 (23) = happyShift action_21
action_26 (24) = happyShift action_22
action_26 (25) = happyShift action_23
action_26 _ = happyReduce_3

action_27 (21) = happyShift action_19
action_27 (22) = happyShift action_20
action_27 (23) = happyShift action_21
action_27 (24) = happyShift action_22
action_27 (25) = happyShift action_23
action_27 (27) = happyShift action_25
action_27 _ = happyReduce_2

action_28 (21) = happyShift action_19
action_28 (22) = happyShift action_20
action_28 (23) = happyShift action_21
action_28 (24) = happyShift action_22
action_28 _ = happyReduce_4

action_29 _ = happyReduce_8

action_30 _ = happyReduce_7

action_31 (23) = happyShift action_21
action_31 (24) = happyShift action_22
action_31 _ = happyReduce_6

action_32 (23) = happyShift action_21
action_32 (24) = happyShift action_22
action_32 _ = happyReduce_5

action_33 _ = happyReduce_15

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (DFunAp (DBinOp "||") [happy_var_1, happy_var_3] None
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (DFunAp (DBinOp "&&") [happy_var_1, happy_var_3] None
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	(HappyTerminal (TokenCmp happy_var_2))
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (DFunAp (DBinOp happy_var_2) [happy_var_1, happy_var_3] None
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (DFunAp (DBinOp "+") [happy_var_1, happy_var_3] None
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (DFunAp (DBinOp "-") [happy_var_1, happy_var_3] None
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (DFunAp (DBinOp "*") [happy_var_1, happy_var_3] None
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (DFunAp (DBinOp "/") [happy_var_1, happy_var_3] None
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  5 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  6 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (DFunAp (DFun "neg" ) [happy_var_2] None
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (DFunAp (DFun "not" ) [happy_var_2] None
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  8 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (DCExp happy_var_1 None
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn9
		 (DCInt happy_var_1 DTInt
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyTerminal (TokenDouble happy_var_1))
	 =  HappyAbsSyn9
		 (DCDouble happy_var_1 DTDouble
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn9
		 (DCBool happy_var_1 DTBool
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn9
		 (DCAllV
	)

happyReduce_20 = happySpecReduce_1  9 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn9
		 (DCEmpty
	)

happyReduce_21 = happyReduce 4 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (DFunV happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn11
		 (DFun happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn12
		 (DVar happy_var_1 0 None
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 (HappyTerminal (TokenUpper happy_var_1))
	 =  HappyAbsSyn12
		 (DVarV happy_var_1 0
	)
happyReduction_24 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 30 30 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 13;
	TokenDouble happy_dollar_dollar -> cont 14;
	TokenBool happy_dollar_dollar -> cont 15;
	TokenEmpty -> cont 16;
	TokenV -> cont 17;
	TokenNot -> cont 18;
	TokenLParen -> cont 19;
	TokenRParen -> cont 20;
	TokenPlus -> cont 21;
	TokenMinus -> cont 22;
	TokenMul -> cont 23;
	TokenDev -> cont 24;
	TokenCmp happy_dollar_dollar -> cont 25;
	TokenOr -> cont 26;
	TokenAnd -> cont 27;
	TokenUpper happy_dollar_dollar -> cont 28;
	TokenString happy_dollar_dollar -> cont 29;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 30 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a    
parseError x = error $ "Parse error" ++ show x
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
