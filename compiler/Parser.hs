{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import Spec
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,499) ([0,0,0,0,2,0,0,0,16,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,96,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,2,0,0,0,16384,0,0,0,0,584,384,0,0,0,3072,0,16256,641,25663,0,0,0,1,0,0,0,0,0,0,65280,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1520,57360,3207,0,16256,641,25663,0,31744,1025,8696,3,57344,8271,4032,25,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,32768,0,0,0,0,12288,9,6,0,0,0,0,0,0,256,0,0,1024,0,0,0,8192,0,0,0,0,0,0,3,0,0,8,0,0,639,32261,200,0,5112,61480,1603,0,40896,33088,12831,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,640,0,0,0,0,0,63488,2067,17392,6,0,49088,0,8,0,0,0,0,0,2048,0,0,0,0,0,0,0,64512,5129,8696,3,57344,8271,4032,25,0,639,32257,200,0,5112,61448,1603,0,40896,32832,12831,0,65024,516,37116,1,61440,4135,34784,12,32768,33087,16128,100,0,2556,63492,801,0,0,0,0,0,0,31,0,0,0,1272,0,0,0,14272,0,0,0,7680,0,0,0,0,0,0,0,0,0,0,0,0,48,0,0,0,384,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,32768,0,32768,1,0,4088,0,0,32768,0,0,0,0,0,0,0,0,0,2048,0,0,32768,0,0,0,0,4,0,0,0,0,0,0,0,0,2,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,32768,0,0,0,0,1536,0,0,0,12288,0,0,0,0,0,0,0,2048,0,0,64,0,2,0,0,0,0,0,3040,0,6400,0,0,256,0,0,0,2048,0,0,0,0,73,48,0,0,588,384,0,0,4672,3072,0,16256,129,25663,0,0,2048,0,0,0,0,4096,0,0,0,0,192,0,760,61448,1619,0,0,0,1280,0,0,0,32768,1,0,0,0,0,0,0,0,0,0,380,63492,801,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,49088,0,0,0,0,588,384,0,0,0,0,0,0,2048,0,0,0,16384,0,0,57344,11,0,25,0,0,0,0,0,0,0,0,0,0,0,64,0,65024,2564,37116,1,0,0,0,0,0,64,0,2,0,0,4,0,0,0,32,0,0,0,9216,49153,0,63488,2067,17392,6,0,32768,0,0,0,190,0,400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24544,0,0,0,0,294,192,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","programSpec","funDefs","funDef","mainDef","statements","statement","expr","expr4","expr3","expr2","expr1","expr0","vars","expr0s","inExprs","inExpr","vid","vids","agg","gen","const","fun","var","INT","DOUBLE","BOOL","'empty'","'V'","'not'","'('","')'","'+'","'-'","'*'","'/'","CMP","'!!'","'&&'","'\\\\'","'{'","'}'","'if'","'then'","'else'","'while'","';'","'='","'return'","'minimum'","'maximum'","'sum'","'prod'","'and'","'or'","'<-'","'in'","'nvals'","','","'['","']'","'|'","UPPER","STRING","%eof"]
        bit_start = st Prelude.* 67
        bit_end = (st Prelude.+ 1) Prelude.* 67
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..66]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (66) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (7) = happyGoto action_2
action_0 (25) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (66) = happyShift action_4
action_1 (7) = happyGoto action_2
action_1 (25) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (5) = happyGoto action_7
action_2 _ = happyReduce_2

action_3 (33) = happyShift action_6
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_61

action_5 (67) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (34) = happyShift action_12
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (65) = happyShift action_10
action_7 (66) = happyShift action_11
action_7 (6) = happyGoto action_8
action_7 (26) = happyGoto action_9
action_7 _ = happyReduce_1

action_8 _ = happyReduce_3

action_9 (50) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_63

action_11 (33) = happyShift action_14
action_11 _ = happyReduce_62

action_12 (43) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (45) = happyShift action_46
action_13 (48) = happyShift action_47
action_13 (51) = happyShift action_48
action_13 (65) = happyShift action_10
action_13 (66) = happyShift action_11
action_13 (8) = happyGoto action_43
action_13 (9) = happyGoto action_44
action_13 (26) = happyGoto action_45
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (65) = happyShift action_10
action_14 (66) = happyShift action_11
action_14 (26) = happyGoto action_42
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (27) = happyShift action_25
action_15 (28) = happyShift action_26
action_15 (29) = happyShift action_27
action_15 (30) = happyShift action_28
action_15 (31) = happyShift action_29
action_15 (32) = happyShift action_30
action_15 (33) = happyShift action_31
action_15 (36) = happyShift action_32
action_15 (43) = happyShift action_33
action_15 (45) = happyShift action_34
action_15 (52) = happyShift action_35
action_15 (53) = happyShift action_36
action_15 (54) = happyShift action_37
action_15 (55) = happyShift action_38
action_15 (56) = happyShift action_39
action_15 (57) = happyShift action_40
action_15 (62) = happyShift action_41
action_15 (65) = happyShift action_10
action_15 (66) = happyShift action_11
action_15 (10) = happyGoto action_16
action_15 (11) = happyGoto action_17
action_15 (12) = happyGoto action_18
action_15 (13) = happyGoto action_19
action_15 (14) = happyGoto action_20
action_15 (15) = happyGoto action_21
action_15 (22) = happyGoto action_22
action_15 (24) = happyGoto action_23
action_15 (26) = happyGoto action_24
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (49) = happyShift action_73
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_13

action_18 (35) = happyShift action_65
action_18 (36) = happyShift action_66
action_18 (37) = happyShift action_67
action_18 (38) = happyShift action_68
action_18 (39) = happyShift action_69
action_18 (40) = happyShift action_70
action_18 (41) = happyShift action_71
action_18 (42) = happyShift action_72
action_18 _ = happyReduce_16

action_19 _ = happyReduce_25

action_20 _ = happyReduce_28

action_21 _ = happyReduce_33

action_22 (62) = happyShift action_64
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_34

action_24 _ = happyReduce_36

action_25 _ = happyReduce_56

action_26 _ = happyReduce_57

action_27 _ = happyReduce_58

action_28 _ = happyReduce_60

action_29 _ = happyReduce_59

action_30 (27) = happyShift action_25
action_30 (28) = happyShift action_26
action_30 (29) = happyShift action_27
action_30 (30) = happyShift action_28
action_30 (31) = happyShift action_29
action_30 (33) = happyShift action_31
action_30 (43) = happyShift action_33
action_30 (52) = happyShift action_35
action_30 (53) = happyShift action_36
action_30 (54) = happyShift action_37
action_30 (55) = happyShift action_38
action_30 (56) = happyShift action_39
action_30 (57) = happyShift action_40
action_30 (62) = happyShift action_41
action_30 (65) = happyShift action_10
action_30 (66) = happyShift action_11
action_30 (14) = happyGoto action_63
action_30 (15) = happyGoto action_21
action_30 (22) = happyGoto action_22
action_30 (24) = happyGoto action_23
action_30 (26) = happyGoto action_24
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (27) = happyShift action_25
action_31 (28) = happyShift action_26
action_31 (29) = happyShift action_27
action_31 (30) = happyShift action_28
action_31 (31) = happyShift action_29
action_31 (32) = happyShift action_30
action_31 (33) = happyShift action_31
action_31 (36) = happyShift action_32
action_31 (43) = happyShift action_33
action_31 (45) = happyShift action_34
action_31 (52) = happyShift action_35
action_31 (53) = happyShift action_36
action_31 (54) = happyShift action_37
action_31 (55) = happyShift action_38
action_31 (56) = happyShift action_39
action_31 (57) = happyShift action_40
action_31 (62) = happyShift action_41
action_31 (65) = happyShift action_10
action_31 (66) = happyShift action_11
action_31 (10) = happyGoto action_62
action_31 (11) = happyGoto action_17
action_31 (12) = happyGoto action_18
action_31 (13) = happyGoto action_19
action_31 (14) = happyGoto action_20
action_31 (15) = happyGoto action_21
action_31 (22) = happyGoto action_22
action_31 (24) = happyGoto action_23
action_31 (26) = happyGoto action_24
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (27) = happyShift action_25
action_32 (28) = happyShift action_26
action_32 (29) = happyShift action_27
action_32 (30) = happyShift action_28
action_32 (31) = happyShift action_29
action_32 (33) = happyShift action_31
action_32 (43) = happyShift action_33
action_32 (52) = happyShift action_35
action_32 (53) = happyShift action_36
action_32 (54) = happyShift action_37
action_32 (55) = happyShift action_38
action_32 (56) = happyShift action_39
action_32 (57) = happyShift action_40
action_32 (62) = happyShift action_41
action_32 (65) = happyShift action_10
action_32 (66) = happyShift action_11
action_32 (14) = happyGoto action_61
action_32 (15) = happyGoto action_21
action_32 (22) = happyGoto action_22
action_32 (24) = happyGoto action_23
action_32 (26) = happyGoto action_24
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (27) = happyShift action_25
action_33 (28) = happyShift action_26
action_33 (29) = happyShift action_27
action_33 (30) = happyShift action_28
action_33 (31) = happyShift action_29
action_33 (32) = happyShift action_30
action_33 (33) = happyShift action_31
action_33 (36) = happyShift action_32
action_33 (43) = happyShift action_33
action_33 (52) = happyShift action_35
action_33 (53) = happyShift action_36
action_33 (54) = happyShift action_37
action_33 (55) = happyShift action_38
action_33 (56) = happyShift action_39
action_33 (57) = happyShift action_40
action_33 (62) = happyShift action_41
action_33 (65) = happyShift action_10
action_33 (66) = happyShift action_11
action_33 (12) = happyGoto action_60
action_33 (13) = happyGoto action_19
action_33 (14) = happyGoto action_20
action_33 (15) = happyGoto action_21
action_33 (22) = happyGoto action_22
action_33 (24) = happyGoto action_23
action_33 (26) = happyGoto action_24
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (33) = happyShift action_59
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_48

action_36 _ = happyReduce_49

action_37 _ = happyReduce_50

action_38 _ = happyReduce_51

action_39 _ = happyReduce_52

action_40 _ = happyReduce_53

action_41 (27) = happyShift action_58
action_41 (20) = happyGoto action_56
action_41 (21) = happyGoto action_57
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (34) = happyShift action_55
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (44) = happyShift action_54
action_43 (45) = happyShift action_46
action_43 (48) = happyShift action_47
action_43 (51) = happyShift action_48
action_43 (65) = happyShift action_10
action_43 (66) = happyShift action_11
action_43 (9) = happyGoto action_53
action_43 (26) = happyGoto action_45
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_6

action_45 (50) = happyShift action_52
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (33) = happyShift action_51
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (33) = happyShift action_50
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (65) = happyShift action_10
action_48 (66) = happyShift action_11
action_48 (26) = happyGoto action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (49) = happyShift action_92
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (27) = happyShift action_25
action_50 (28) = happyShift action_26
action_50 (29) = happyShift action_27
action_50 (30) = happyShift action_28
action_50 (31) = happyShift action_29
action_50 (32) = happyShift action_30
action_50 (33) = happyShift action_31
action_50 (36) = happyShift action_32
action_50 (43) = happyShift action_33
action_50 (45) = happyShift action_34
action_50 (52) = happyShift action_35
action_50 (53) = happyShift action_36
action_50 (54) = happyShift action_37
action_50 (55) = happyShift action_38
action_50 (56) = happyShift action_39
action_50 (57) = happyShift action_40
action_50 (62) = happyShift action_41
action_50 (65) = happyShift action_10
action_50 (66) = happyShift action_11
action_50 (10) = happyGoto action_91
action_50 (11) = happyGoto action_17
action_50 (12) = happyGoto action_18
action_50 (13) = happyGoto action_19
action_50 (14) = happyGoto action_20
action_50 (15) = happyGoto action_21
action_50 (22) = happyGoto action_22
action_50 (24) = happyGoto action_23
action_50 (26) = happyGoto action_24
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (27) = happyShift action_25
action_51 (28) = happyShift action_26
action_51 (29) = happyShift action_27
action_51 (30) = happyShift action_28
action_51 (31) = happyShift action_29
action_51 (32) = happyShift action_30
action_51 (33) = happyShift action_31
action_51 (36) = happyShift action_32
action_51 (43) = happyShift action_33
action_51 (45) = happyShift action_34
action_51 (52) = happyShift action_35
action_51 (53) = happyShift action_36
action_51 (54) = happyShift action_37
action_51 (55) = happyShift action_38
action_51 (56) = happyShift action_39
action_51 (57) = happyShift action_40
action_51 (62) = happyShift action_41
action_51 (65) = happyShift action_10
action_51 (66) = happyShift action_11
action_51 (10) = happyGoto action_90
action_51 (11) = happyGoto action_17
action_51 (12) = happyGoto action_18
action_51 (13) = happyGoto action_19
action_51 (14) = happyGoto action_20
action_51 (15) = happyGoto action_21
action_51 (22) = happyGoto action_22
action_51 (24) = happyGoto action_23
action_51 (26) = happyGoto action_24
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (27) = happyShift action_25
action_52 (28) = happyShift action_26
action_52 (29) = happyShift action_27
action_52 (30) = happyShift action_28
action_52 (31) = happyShift action_29
action_52 (32) = happyShift action_30
action_52 (33) = happyShift action_31
action_52 (36) = happyShift action_32
action_52 (43) = happyShift action_33
action_52 (45) = happyShift action_34
action_52 (52) = happyShift action_35
action_52 (53) = happyShift action_36
action_52 (54) = happyShift action_37
action_52 (55) = happyShift action_38
action_52 (56) = happyShift action_39
action_52 (57) = happyShift action_40
action_52 (62) = happyShift action_41
action_52 (65) = happyShift action_10
action_52 (66) = happyShift action_11
action_52 (10) = happyGoto action_89
action_52 (11) = happyGoto action_17
action_52 (12) = happyGoto action_18
action_52 (13) = happyGoto action_19
action_52 (14) = happyGoto action_20
action_52 (15) = happyGoto action_21
action_52 (22) = happyGoto action_22
action_52 (24) = happyGoto action_23
action_52 (26) = happyGoto action_24
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_7

action_54 _ = happyReduce_5

action_55 _ = happyReduce_64

action_56 _ = happyReduce_47

action_57 (61) = happyShift action_87
action_57 (63) = happyShift action_88
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_45

action_59 (27) = happyShift action_25
action_59 (28) = happyShift action_26
action_59 (29) = happyShift action_27
action_59 (30) = happyShift action_28
action_59 (31) = happyShift action_29
action_59 (32) = happyShift action_30
action_59 (33) = happyShift action_31
action_59 (36) = happyShift action_32
action_59 (43) = happyShift action_33
action_59 (52) = happyShift action_35
action_59 (53) = happyShift action_36
action_59 (54) = happyShift action_37
action_59 (55) = happyShift action_38
action_59 (56) = happyShift action_39
action_59 (57) = happyShift action_40
action_59 (62) = happyShift action_41
action_59 (65) = happyShift action_10
action_59 (66) = happyShift action_11
action_59 (12) = happyGoto action_86
action_59 (13) = happyGoto action_19
action_59 (14) = happyGoto action_20
action_59 (15) = happyGoto action_21
action_59 (22) = happyGoto action_22
action_59 (24) = happyGoto action_23
action_59 (26) = happyGoto action_24
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (35) = happyShift action_65
action_60 (36) = happyShift action_66
action_60 (37) = happyShift action_67
action_60 (38) = happyShift action_68
action_60 (39) = happyShift action_69
action_60 (40) = happyShift action_70
action_60 (41) = happyShift action_71
action_60 (42) = happyShift action_72
action_60 (44) = happyShift action_84
action_60 (64) = happyShift action_85
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_26

action_62 (34) = happyShift action_83
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_27

action_64 (27) = happyShift action_25
action_64 (28) = happyShift action_26
action_64 (29) = happyShift action_27
action_64 (30) = happyShift action_28
action_64 (31) = happyShift action_29
action_64 (32) = happyShift action_30
action_64 (33) = happyShift action_31
action_64 (36) = happyShift action_32
action_64 (43) = happyShift action_33
action_64 (45) = happyShift action_34
action_64 (52) = happyShift action_35
action_64 (53) = happyShift action_36
action_64 (54) = happyShift action_37
action_64 (55) = happyShift action_38
action_64 (56) = happyShift action_39
action_64 (57) = happyShift action_40
action_64 (62) = happyShift action_41
action_64 (65) = happyShift action_10
action_64 (66) = happyShift action_11
action_64 (10) = happyGoto action_82
action_64 (11) = happyGoto action_17
action_64 (12) = happyGoto action_18
action_64 (13) = happyGoto action_19
action_64 (14) = happyGoto action_20
action_64 (15) = happyGoto action_21
action_64 (22) = happyGoto action_22
action_64 (24) = happyGoto action_23
action_64 (26) = happyGoto action_24
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (27) = happyShift action_25
action_65 (28) = happyShift action_26
action_65 (29) = happyShift action_27
action_65 (30) = happyShift action_28
action_65 (31) = happyShift action_29
action_65 (32) = happyShift action_30
action_65 (33) = happyShift action_31
action_65 (36) = happyShift action_32
action_65 (43) = happyShift action_33
action_65 (52) = happyShift action_35
action_65 (53) = happyShift action_36
action_65 (54) = happyShift action_37
action_65 (55) = happyShift action_38
action_65 (56) = happyShift action_39
action_65 (57) = happyShift action_40
action_65 (62) = happyShift action_41
action_65 (65) = happyShift action_10
action_65 (66) = happyShift action_11
action_65 (12) = happyGoto action_81
action_65 (13) = happyGoto action_19
action_65 (14) = happyGoto action_20
action_65 (15) = happyGoto action_21
action_65 (22) = happyGoto action_22
action_65 (24) = happyGoto action_23
action_65 (26) = happyGoto action_24
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (27) = happyShift action_25
action_66 (28) = happyShift action_26
action_66 (29) = happyShift action_27
action_66 (30) = happyShift action_28
action_66 (31) = happyShift action_29
action_66 (32) = happyShift action_30
action_66 (33) = happyShift action_31
action_66 (36) = happyShift action_32
action_66 (43) = happyShift action_33
action_66 (52) = happyShift action_35
action_66 (53) = happyShift action_36
action_66 (54) = happyShift action_37
action_66 (55) = happyShift action_38
action_66 (56) = happyShift action_39
action_66 (57) = happyShift action_40
action_66 (62) = happyShift action_41
action_66 (65) = happyShift action_10
action_66 (66) = happyShift action_11
action_66 (12) = happyGoto action_80
action_66 (13) = happyGoto action_19
action_66 (14) = happyGoto action_20
action_66 (15) = happyGoto action_21
action_66 (22) = happyGoto action_22
action_66 (24) = happyGoto action_23
action_66 (26) = happyGoto action_24
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (27) = happyShift action_25
action_67 (28) = happyShift action_26
action_67 (29) = happyShift action_27
action_67 (30) = happyShift action_28
action_67 (31) = happyShift action_29
action_67 (32) = happyShift action_30
action_67 (33) = happyShift action_31
action_67 (36) = happyShift action_32
action_67 (43) = happyShift action_33
action_67 (52) = happyShift action_35
action_67 (53) = happyShift action_36
action_67 (54) = happyShift action_37
action_67 (55) = happyShift action_38
action_67 (56) = happyShift action_39
action_67 (57) = happyShift action_40
action_67 (62) = happyShift action_41
action_67 (65) = happyShift action_10
action_67 (66) = happyShift action_11
action_67 (12) = happyGoto action_79
action_67 (13) = happyGoto action_19
action_67 (14) = happyGoto action_20
action_67 (15) = happyGoto action_21
action_67 (22) = happyGoto action_22
action_67 (24) = happyGoto action_23
action_67 (26) = happyGoto action_24
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (27) = happyShift action_25
action_68 (28) = happyShift action_26
action_68 (29) = happyShift action_27
action_68 (30) = happyShift action_28
action_68 (31) = happyShift action_29
action_68 (32) = happyShift action_30
action_68 (33) = happyShift action_31
action_68 (36) = happyShift action_32
action_68 (43) = happyShift action_33
action_68 (52) = happyShift action_35
action_68 (53) = happyShift action_36
action_68 (54) = happyShift action_37
action_68 (55) = happyShift action_38
action_68 (56) = happyShift action_39
action_68 (57) = happyShift action_40
action_68 (62) = happyShift action_41
action_68 (65) = happyShift action_10
action_68 (66) = happyShift action_11
action_68 (12) = happyGoto action_78
action_68 (13) = happyGoto action_19
action_68 (14) = happyGoto action_20
action_68 (15) = happyGoto action_21
action_68 (22) = happyGoto action_22
action_68 (24) = happyGoto action_23
action_68 (26) = happyGoto action_24
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (27) = happyShift action_25
action_69 (28) = happyShift action_26
action_69 (29) = happyShift action_27
action_69 (30) = happyShift action_28
action_69 (31) = happyShift action_29
action_69 (32) = happyShift action_30
action_69 (33) = happyShift action_31
action_69 (36) = happyShift action_32
action_69 (43) = happyShift action_33
action_69 (52) = happyShift action_35
action_69 (53) = happyShift action_36
action_69 (54) = happyShift action_37
action_69 (55) = happyShift action_38
action_69 (56) = happyShift action_39
action_69 (57) = happyShift action_40
action_69 (62) = happyShift action_41
action_69 (65) = happyShift action_10
action_69 (66) = happyShift action_11
action_69 (12) = happyGoto action_77
action_69 (13) = happyGoto action_19
action_69 (14) = happyGoto action_20
action_69 (15) = happyGoto action_21
action_69 (22) = happyGoto action_22
action_69 (24) = happyGoto action_23
action_69 (26) = happyGoto action_24
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (27) = happyShift action_25
action_70 (28) = happyShift action_26
action_70 (29) = happyShift action_27
action_70 (30) = happyShift action_28
action_70 (31) = happyShift action_29
action_70 (32) = happyShift action_30
action_70 (33) = happyShift action_31
action_70 (36) = happyShift action_32
action_70 (43) = happyShift action_33
action_70 (52) = happyShift action_35
action_70 (53) = happyShift action_36
action_70 (54) = happyShift action_37
action_70 (55) = happyShift action_38
action_70 (56) = happyShift action_39
action_70 (57) = happyShift action_40
action_70 (62) = happyShift action_41
action_70 (65) = happyShift action_10
action_70 (66) = happyShift action_11
action_70 (12) = happyGoto action_76
action_70 (13) = happyGoto action_19
action_70 (14) = happyGoto action_20
action_70 (15) = happyGoto action_21
action_70 (22) = happyGoto action_22
action_70 (24) = happyGoto action_23
action_70 (26) = happyGoto action_24
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (27) = happyShift action_25
action_71 (28) = happyShift action_26
action_71 (29) = happyShift action_27
action_71 (30) = happyShift action_28
action_71 (31) = happyShift action_29
action_71 (32) = happyShift action_30
action_71 (33) = happyShift action_31
action_71 (36) = happyShift action_32
action_71 (43) = happyShift action_33
action_71 (52) = happyShift action_35
action_71 (53) = happyShift action_36
action_71 (54) = happyShift action_37
action_71 (55) = happyShift action_38
action_71 (56) = happyShift action_39
action_71 (57) = happyShift action_40
action_71 (62) = happyShift action_41
action_71 (65) = happyShift action_10
action_71 (66) = happyShift action_11
action_71 (12) = happyGoto action_75
action_71 (13) = happyGoto action_19
action_71 (14) = happyGoto action_20
action_71 (15) = happyGoto action_21
action_71 (22) = happyGoto action_22
action_71 (24) = happyGoto action_23
action_71 (26) = happyGoto action_24
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (27) = happyShift action_25
action_72 (28) = happyShift action_26
action_72 (29) = happyShift action_27
action_72 (30) = happyShift action_28
action_72 (31) = happyShift action_29
action_72 (32) = happyShift action_30
action_72 (33) = happyShift action_31
action_72 (36) = happyShift action_32
action_72 (43) = happyShift action_33
action_72 (52) = happyShift action_35
action_72 (53) = happyShift action_36
action_72 (54) = happyShift action_37
action_72 (55) = happyShift action_38
action_72 (56) = happyShift action_39
action_72 (57) = happyShift action_40
action_72 (62) = happyShift action_41
action_72 (65) = happyShift action_10
action_72 (66) = happyShift action_11
action_72 (12) = happyGoto action_74
action_72 (13) = happyGoto action_19
action_72 (14) = happyGoto action_20
action_72 (15) = happyGoto action_21
action_72 (22) = happyGoto action_22
action_72 (24) = happyGoto action_23
action_72 (26) = happyGoto action_24
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_4

action_74 (35) = happyShift action_65
action_74 (36) = happyShift action_66
action_74 (37) = happyShift action_67
action_74 (38) = happyShift action_68
action_74 (39) = happyShift action_69
action_74 _ = happyReduce_19

action_75 (35) = happyShift action_65
action_75 (36) = happyShift action_66
action_75 (37) = happyShift action_67
action_75 (38) = happyShift action_68
action_75 (39) = happyShift action_69
action_75 (42) = happyShift action_72
action_75 _ = happyReduce_18

action_76 (35) = happyShift action_65
action_76 (36) = happyShift action_66
action_76 (37) = happyShift action_67
action_76 (38) = happyShift action_68
action_76 (39) = happyShift action_69
action_76 (41) = happyShift action_71
action_76 (42) = happyShift action_72
action_76 _ = happyReduce_17

action_77 (35) = happyShift action_65
action_77 (36) = happyShift action_66
action_77 (37) = happyShift action_67
action_77 (38) = happyShift action_68
action_77 (39) = happyFail []
action_77 _ = happyReduce_20

action_78 _ = happyReduce_24

action_79 _ = happyReduce_23

action_80 (37) = happyShift action_67
action_80 (38) = happyShift action_68
action_80 _ = happyReduce_22

action_81 (37) = happyShift action_67
action_81 (38) = happyShift action_68
action_81 _ = happyReduce_21

action_82 (64) = happyShift action_100
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_35

action_84 _ = happyReduce_31

action_85 (33) = happyShift action_99
action_85 (65) = happyShift action_10
action_85 (66) = happyShift action_11
action_85 (26) = happyGoto action_98
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (34) = happyShift action_97
action_86 (35) = happyShift action_65
action_86 (36) = happyShift action_66
action_86 (37) = happyShift action_67
action_86 (38) = happyShift action_68
action_86 (39) = happyShift action_69
action_86 (40) = happyShift action_70
action_86 (41) = happyShift action_71
action_86 (42) = happyShift action_72
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (27) = happyShift action_58
action_87 (20) = happyGoto action_96
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_37

action_89 (49) = happyShift action_95
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (34) = happyShift action_94
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (34) = happyShift action_93
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_12

action_93 (43) = happyShift action_108
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (46) = happyShift action_107
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_8

action_96 _ = happyReduce_46

action_97 (46) = happyShift action_106
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (58) = happyShift action_105
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (65) = happyShift action_10
action_99 (66) = happyShift action_11
action_99 (16) = happyGoto action_103
action_99 (26) = happyGoto action_104
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (65) = happyShift action_10
action_100 (66) = happyShift action_11
action_100 (23) = happyGoto action_101
action_100 (26) = happyGoto action_102
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (18) = happyGoto action_116
action_101 _ = happyReduce_42

action_102 (58) = happyShift action_115
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (34) = happyShift action_113
action_103 (61) = happyShift action_114
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_38

action_105 (27) = happyShift action_25
action_105 (28) = happyShift action_26
action_105 (29) = happyShift action_27
action_105 (30) = happyShift action_28
action_105 (31) = happyShift action_29
action_105 (33) = happyShift action_31
action_105 (62) = happyShift action_41
action_105 (65) = happyShift action_10
action_105 (66) = happyShift action_11
action_105 (15) = happyGoto action_112
action_105 (24) = happyGoto action_23
action_105 (26) = happyGoto action_24
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (43) = happyShift action_111
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (43) = happyShift action_110
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (45) = happyShift action_46
action_108 (48) = happyShift action_47
action_108 (51) = happyShift action_48
action_108 (65) = happyShift action_10
action_108 (66) = happyShift action_11
action_108 (8) = happyGoto action_109
action_108 (9) = happyGoto action_44
action_108 (26) = happyGoto action_45
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (44) = happyShift action_126
action_109 (45) = happyShift action_46
action_109 (48) = happyShift action_47
action_109 (51) = happyShift action_48
action_109 (65) = happyShift action_10
action_109 (66) = happyShift action_11
action_109 (9) = happyGoto action_53
action_109 (26) = happyGoto action_45
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (45) = happyShift action_46
action_110 (48) = happyShift action_47
action_110 (51) = happyShift action_48
action_110 (65) = happyShift action_10
action_110 (66) = happyShift action_11
action_110 (8) = happyGoto action_125
action_110 (9) = happyGoto action_44
action_110 (26) = happyGoto action_45
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (27) = happyShift action_25
action_111 (28) = happyShift action_26
action_111 (29) = happyShift action_27
action_111 (30) = happyShift action_28
action_111 (31) = happyShift action_29
action_111 (32) = happyShift action_30
action_111 (33) = happyShift action_31
action_111 (36) = happyShift action_32
action_111 (43) = happyShift action_33
action_111 (52) = happyShift action_35
action_111 (53) = happyShift action_36
action_111 (54) = happyShift action_37
action_111 (55) = happyShift action_38
action_111 (56) = happyShift action_39
action_111 (57) = happyShift action_40
action_111 (62) = happyShift action_41
action_111 (65) = happyShift action_10
action_111 (66) = happyShift action_11
action_111 (12) = happyGoto action_124
action_111 (13) = happyGoto action_19
action_111 (14) = happyGoto action_20
action_111 (15) = happyGoto action_21
action_111 (22) = happyGoto action_22
action_111 (24) = happyGoto action_23
action_111 (26) = happyGoto action_24
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (44) = happyShift action_123
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (58) = happyShift action_122
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (65) = happyShift action_10
action_114 (66) = happyShift action_11
action_114 (26) = happyGoto action_121
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (27) = happyShift action_25
action_115 (28) = happyShift action_26
action_115 (29) = happyShift action_27
action_115 (30) = happyShift action_28
action_115 (31) = happyShift action_29
action_115 (33) = happyShift action_31
action_115 (43) = happyShift action_33
action_115 (52) = happyShift action_35
action_115 (53) = happyShift action_36
action_115 (54) = happyShift action_37
action_115 (55) = happyShift action_38
action_115 (56) = happyShift action_39
action_115 (57) = happyShift action_40
action_115 (60) = happyShift action_120
action_115 (62) = happyShift action_41
action_115 (65) = happyShift action_10
action_115 (66) = happyShift action_11
action_115 (14) = happyGoto action_119
action_115 (15) = happyGoto action_21
action_115 (22) = happyGoto action_22
action_115 (24) = happyGoto action_23
action_115 (26) = happyGoto action_24
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (61) = happyShift action_117
action_116 (63) = happyShift action_118
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (65) = happyShift action_10
action_117 (66) = happyShift action_11
action_117 (19) = happyGoto action_131
action_117 (26) = happyGoto action_132
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_32

action_119 _ = happyReduce_55

action_120 (27) = happyShift action_25
action_120 (28) = happyShift action_26
action_120 (29) = happyShift action_27
action_120 (30) = happyShift action_28
action_120 (31) = happyShift action_29
action_120 (33) = happyShift action_31
action_120 (43) = happyShift action_33
action_120 (52) = happyShift action_35
action_120 (53) = happyShift action_36
action_120 (54) = happyShift action_37
action_120 (55) = happyShift action_38
action_120 (56) = happyShift action_39
action_120 (57) = happyShift action_40
action_120 (62) = happyShift action_41
action_120 (65) = happyShift action_10
action_120 (66) = happyShift action_11
action_120 (14) = happyGoto action_130
action_120 (15) = happyGoto action_21
action_120 (22) = happyGoto action_22
action_120 (24) = happyGoto action_23
action_120 (26) = happyGoto action_24
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_39

action_122 (33) = happyShift action_129
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_30

action_124 (35) = happyShift action_65
action_124 (36) = happyShift action_66
action_124 (37) = happyShift action_67
action_124 (38) = happyShift action_68
action_124 (39) = happyShift action_69
action_124 (40) = happyShift action_70
action_124 (41) = happyShift action_71
action_124 (42) = happyShift action_72
action_124 (44) = happyShift action_128
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (44) = happyShift action_127
action_125 (45) = happyShift action_46
action_125 (48) = happyShift action_47
action_125 (51) = happyShift action_48
action_125 (65) = happyShift action_10
action_125 (66) = happyShift action_11
action_125 (9) = happyGoto action_53
action_125 (26) = happyGoto action_45
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_11

action_127 (47) = happyShift action_137
action_127 _ = happyReduce_10

action_128 (47) = happyShift action_136
action_128 _ = happyReduce_15

action_129 (27) = happyShift action_25
action_129 (28) = happyShift action_26
action_129 (29) = happyShift action_27
action_129 (30) = happyShift action_28
action_129 (31) = happyShift action_29
action_129 (33) = happyShift action_31
action_129 (62) = happyShift action_41
action_129 (65) = happyShift action_10
action_129 (66) = happyShift action_11
action_129 (15) = happyGoto action_134
action_129 (17) = happyGoto action_135
action_129 (24) = happyGoto action_23
action_129 (26) = happyGoto action_24
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_54

action_131 _ = happyReduce_43

action_132 (59) = happyShift action_133
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (27) = happyShift action_25
action_133 (28) = happyShift action_26
action_133 (29) = happyShift action_27
action_133 (30) = happyShift action_28
action_133 (31) = happyShift action_29
action_133 (32) = happyShift action_30
action_133 (33) = happyShift action_31
action_133 (36) = happyShift action_32
action_133 (43) = happyShift action_33
action_133 (45) = happyShift action_34
action_133 (52) = happyShift action_35
action_133 (53) = happyShift action_36
action_133 (54) = happyShift action_37
action_133 (55) = happyShift action_38
action_133 (56) = happyShift action_39
action_133 (57) = happyShift action_40
action_133 (62) = happyShift action_41
action_133 (65) = happyShift action_10
action_133 (66) = happyShift action_11
action_133 (10) = happyGoto action_142
action_133 (11) = happyGoto action_17
action_133 (12) = happyGoto action_18
action_133 (13) = happyGoto action_19
action_133 (14) = happyGoto action_20
action_133 (15) = happyGoto action_21
action_133 (22) = happyGoto action_22
action_133 (24) = happyGoto action_23
action_133 (26) = happyGoto action_24
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_40

action_135 (34) = happyShift action_140
action_135 (61) = happyShift action_141
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (43) = happyShift action_139
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (43) = happyShift action_138
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (45) = happyShift action_46
action_138 (48) = happyShift action_47
action_138 (51) = happyShift action_48
action_138 (65) = happyShift action_10
action_138 (66) = happyShift action_11
action_138 (8) = happyGoto action_146
action_138 (9) = happyGoto action_44
action_138 (26) = happyGoto action_45
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (27) = happyShift action_25
action_139 (28) = happyShift action_26
action_139 (29) = happyShift action_27
action_139 (30) = happyShift action_28
action_139 (31) = happyShift action_29
action_139 (32) = happyShift action_30
action_139 (33) = happyShift action_31
action_139 (36) = happyShift action_32
action_139 (43) = happyShift action_33
action_139 (52) = happyShift action_35
action_139 (53) = happyShift action_36
action_139 (54) = happyShift action_37
action_139 (55) = happyShift action_38
action_139 (56) = happyShift action_39
action_139 (57) = happyShift action_40
action_139 (62) = happyShift action_41
action_139 (65) = happyShift action_10
action_139 (66) = happyShift action_11
action_139 (12) = happyGoto action_145
action_139 (13) = happyGoto action_19
action_139 (14) = happyGoto action_20
action_139 (15) = happyGoto action_21
action_139 (22) = happyGoto action_22
action_139 (24) = happyGoto action_23
action_139 (26) = happyGoto action_24
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (44) = happyShift action_144
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (27) = happyShift action_25
action_141 (28) = happyShift action_26
action_141 (29) = happyShift action_27
action_141 (30) = happyShift action_28
action_141 (31) = happyShift action_29
action_141 (33) = happyShift action_31
action_141 (62) = happyShift action_41
action_141 (65) = happyShift action_10
action_141 (66) = happyShift action_11
action_141 (15) = happyGoto action_143
action_141 (24) = happyGoto action_23
action_141 (26) = happyGoto action_24
action_141 _ = happyFail (happyExpListPerState 141)

action_142 _ = happyReduce_44

action_143 _ = happyReduce_41

action_144 _ = happyReduce_29

action_145 (35) = happyShift action_65
action_145 (36) = happyShift action_66
action_145 (37) = happyShift action_67
action_145 (38) = happyShift action_68
action_145 (39) = happyShift action_69
action_145 (40) = happyShift action_70
action_145 (41) = happyShift action_71
action_145 (42) = happyShift action_72
action_145 (44) = happyShift action_148
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (44) = happyShift action_147
action_146 (45) = happyShift action_46
action_146 (48) = happyShift action_47
action_146 (51) = happyShift action_48
action_146 (65) = happyShift action_10
action_146 (66) = happyShift action_11
action_146 (9) = happyGoto action_53
action_146 (26) = happyGoto action_45
action_146 _ = happyFail (happyExpListPerState 146)

action_147 _ = happyReduce_9

action_148 _ = happyReduce_14

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 (DProgram happy_var_1 (reverse happy_var_2)
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (DFunDef happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 6 7 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (DMainDef happy_var_1 (reverse happy_var_5)
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  8 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  8 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_2 : happy_var_1
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 9 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DVarDef happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 12 9 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_11) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DIfDef happy_var_3 (reverse happy_var_7) (reverse happy_var_11)
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 8 9 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DIfDef happy_var_3 (reverse happy_var_7) []
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 7 9 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DLoopDef happy_var_3 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (DReturnDef happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 12 11 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_11) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (DIf happy_var_3 happy_var_7 happy_var_11 None
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 8 11 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (DIf happy_var_3 happy_var_7 IfNone None
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  11 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  12 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "||") [happy_var_1, happy_var_3] None
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "&&") [happy_var_1, happy_var_3] None
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "\\") [happy_var_1, happy_var_3] None
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_3)
	(HappyTerminal (Token (TokenCmp happy_var_2) _))
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp happy_var_2) [happy_var_1, happy_var_3] None
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "+") [happy_var_1, happy_var_3] None
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "-") [happy_var_1, happy_var_3] None
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "*") [happy_var_1, happy_var_3] None
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "/") [happy_var_1, happy_var_3] None
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  13 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (DFunAp (DFun "neg" ) [happy_var_2] None
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  13 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (DFunAp (DFun "not" ) [happy_var_2] None
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happyReduce 11 14 happyReduction_29
happyReduction_29 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (DCmprhnsnExp happy_var_2 (zip (reverse happy_var_5) (reverse happy_var_9)) None
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 7 14 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (DCmprhnsnExp happy_var_2 [(happy_var_4,happy_var_6)] None
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (DCmprhnsnExp happy_var_2 [] None
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 7 14 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_6) `HappyStk`
	(HappyAbsSyn23  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (DAggr happy_var_1 happy_var_3 happy_var_5 (reverse happy_var_6) None
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_1  14 happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn15
		 (DCExp happy_var_1 None
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  15 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  15 happyReduction_36
happyReduction_36 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn15
		 (DVExp happy_var_1 None
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (DChoiceVID (reverse happy_var_2) DTBool
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  16 happyReduction_38
happyReduction_38 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 ([ happy_var_1 ]
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_3 : happy_var_1
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  17 happyReduction_40
happyReduction_40 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn17
		 ([ happy_var_1 ]
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  17 happyReduction_41
happyReduction_41 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_3 : happy_var_1
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_0  18 happyReduction_42
happyReduction_42  =  HappyAbsSyn18
		 ([]
	)

happyReduce_43 = happySpecReduce_3  18 happyReduction_43
happyReduction_43 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_3 : happy_var_1
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  19 happyReduction_44
happyReduction_44 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn19
		 (DIn happy_var_1 happy_var_3 None
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  20 happyReduction_45
happyReduction_45 (HappyTerminal (Token (TokenInt happy_var_1) _))
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  21 happyReduction_46
happyReduction_46 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_3 : happy_var_1
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  21 happyReduction_47
happyReduction_47 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 ([ happy_var_1 ]
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  22 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn22
		 (DAggMin
	)

happyReduce_49 = happySpecReduce_1  22 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn22
		 (DAggMax
	)

happyReduce_50 = happySpecReduce_1  22 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn22
		 (DAggSum
	)

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn22
		 (DAggProd
	)

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn22
		 (DAggAnd
	)

happyReduce_53 = happySpecReduce_1  22 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn22
		 (DAggOr
	)

happyReduce_54 = happyReduce 4 23 happyReduction_54
happyReduction_54 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (DGenNvals happy_var_1 happy_var_4 None
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_3  23 happyReduction_55
happyReduction_55 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn23
		 (DGenG happy_var_1 happy_var_3 None
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  24 happyReduction_56
happyReduction_56 (HappyTerminal (Token (TokenInt happy_var_1) _))
	 =  HappyAbsSyn24
		 (DCInt happy_var_1 DTInt
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  24 happyReduction_57
happyReduction_57 (HappyTerminal (Token (TokenDouble happy_var_1)_))
	 =  HappyAbsSyn24
		 (DCDouble happy_var_1 DTDouble
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  24 happyReduction_58
happyReduction_58 (HappyTerminal (Token (TokenBool happy_var_1) _))
	 =  HappyAbsSyn24
		 (DCBool happy_var_1 DTBool
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  24 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn24
		 (DCAllV
	)

happyReduce_60 = happySpecReduce_1  24 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn24
		 (DCEmpty
	)

happyReduce_61 = happySpecReduce_1  25 happyReduction_61
happyReduction_61 (HappyTerminal (Token (TokenString happy_var_1) _))
	 =  HappyAbsSyn25
		 (DFun happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  26 happyReduction_62
happyReduction_62 (HappyTerminal (Token (TokenString happy_var_1) _))
	 =  HappyAbsSyn26
		 (DVar happy_var_1 0 None
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  26 happyReduction_63
happyReduction_63 (HappyTerminal (Token (TokenUpper happy_var_1) _))
	 =  HappyAbsSyn26
		 (DVarV happy_var_1 0
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happyReduce 4 26 happyReduction_64
happyReduction_64 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token (TokenString happy_var_1) _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (DFunV happy_var_1 happy_var_3 None
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	Eof -> action 67 67 tk (HappyState action) sts stk;
	Token (TokenInt happy_dollar_dollar) _ -> cont 27;
	Token (TokenDouble happy_dollar_dollar)_ -> cont 28;
	Token (TokenBool happy_dollar_dollar) _ -> cont 29;
	Token (TokenEmpty) _ -> cont 30;
	Token (TokenV) _ -> cont 31;
	Token (TokenNot) _ -> cont 32;
	Token (TokenLParen) _ -> cont 33;
	Token (TokenRParen) _ -> cont 34;
	Token (TokenPlus) _ -> cont 35;
	Token (TokenMinus) _ -> cont 36;
	Token (TokenMul) _ -> cont 37;
	Token (TokenDev) _ -> cont 38;
	Token (TokenCmp happy_dollar_dollar) _ -> cont 39;
	Token (TokenOr) _ -> cont 40;
	Token (TokenAnd) _ -> cont 41;
	Token (TokenDiff) _ -> cont 42;
	Token (TokenLCurly) _ -> cont 43;
	Token (TokenRCurly) _ -> cont 44;
	Token (TokenIf) _ -> cont 45;
	Token (TokenThen) _ -> cont 46;
	Token (TokenElse) _ -> cont 47;
	Token (TokenWhile) _ -> cont 48;
	Token (TokenSemiColon) _ -> cont 49;
	Token (TokenEqual) _ -> cont 50;
	Token (TokenReturn) _ -> cont 51;
	Token (TokenAggMin) _ -> cont 52;
	Token (TokenAggMax) _ -> cont 53;
	Token (TokenAggSum) _ -> cont 54;
	Token (TokenAggProd) _ -> cont 55;
	Token (TokenAggAnd) _ -> cont 56;
	Token (TokenAggOr) _ -> cont 57;
	Token (TokenLArrow) _ -> cont 58;
	Token (TokenIn) _ -> cont 59;
	Token (TokenNvals) _ -> cont 60;
	Token (TokenComma) _ -> cont 61;
	Token (TokenLBrack) _ -> cont 62;
	Token (TokenRBrack) _ -> cont 63;
	Token (TokenVbar) _ -> cont 64;
	Token (TokenUpper happy_dollar_dollar) _ -> cont 65;
	Token (TokenString happy_dollar_dollar) _ -> cont 66;
	_ -> happyError' (tk, [])
	})

happyError_ explist 67 tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Alex a -> (a -> Alex b) -> Alex b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> Alex a
happyReturn = (Prelude.return)
happyThen1 :: () => Alex a -> (a -> Alex b) -> Alex b
happyThen1 = happyThen
happyReturn1 :: () => a -> Alex a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [Prelude.String]) -> Alex a
happyError' tk = (\(tokens, _) -> parseError tokens) tk
parser = happySomeParser where
 happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


lexer :: (Token -> Alex a) -> Alex a
lexer = (alexMonadScan >>=)

parseError :: Token -> Alex a    
parseError (Token token pos) = alexError $ "Parse error" ++ show pos

parse s = runAlex s parser

ps :: AlexState -> AlexState
ps s@AlexState{alex_ust=AlexUserState{scope = sc}} = s{alex_ust = AlexUserState{scope = sc + 1}}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
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
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
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





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









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
