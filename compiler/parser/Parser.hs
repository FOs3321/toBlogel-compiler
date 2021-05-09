{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import Spec
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,485) ([0,0,0,0,1,0,0,0,4,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,24576,0,0,0,0,0,0,0,4,0,0,0,0,0,0,64,0,0,0,0,2,0,0,0,2336,1536,0,0,0,6144,0,32512,642,25663,0,0,32768,0,0,0,0,0,0,0,8128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6080,49184,6415,0,32512,642,25663,0,31744,513,37116,1,61440,2087,17392,6,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,32,0,0,0,0,147,96,0,0,0,0,0,0,1024,0,0,4096,0,0,0,16384,0,0,0,0,0,32768,1,0,0,2,0,49152,41119,4032,25,0,33407,16130,100,0,2556,64522,400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,40960,0,0,0,0,0,0,33407,16128,100,0,64512,5,64,0,0,0,0,0,8192,0,0,0,0,0,0,0,64512,2569,37116,1,61440,2087,17392,6,49152,8351,4032,25,0,33407,16128,100,0,2556,64514,400,0,10224,61448,1603,0,40896,49184,6415,0,32512,130,25663,0,0,0,0,0,0,496,0,0,0,6080,0,0,0,3840,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,12,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,64,0,96,0,65024,1,0,0,16,0,0,0,0,0,0,0,0,8192,0,0,0,2,0,0,0,8,0,0,0,0,0,0,0,32768,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,256,0,0,0,0,6,0,0,0,24,0,0,0,0,0,0,0,1,0,2048,0,32,0,0,0,0,0,24320,0,25600,0,0,512,0,0,0,2048,0,0,0,32768,36,24,0,0,147,96,0,0,584,384,0,10224,61448,1603,0,0,64,0,0,0,0,64,0,0,0,32768,1,61440,2053,21488,6,0,0,32768,2,0,0,0,96,0,0,0,0,0,0,0,0,0,6080,49184,6415,0,0,0,0,0,0,1,0,0,0,0,0,0,0,24512,0,0,0,0,147,96,0,0,0,0,0,0,128,0,0,0,512,0,0,24320,0,25600,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,33407,16130,100,0,0,0,0,0,2048,0,32,0,0,32,0,0,0,128,0,0,0,18432,32770,1,61440,2087,17392,6,0,16384,0,0,0,95,0,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,383,0,0,0,19456,32770,1,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","programSpec","funDefs","funDef","mainDef","statements","statement","expr","expr4","expr3","expr2","expr1","expr0","vars","expr0s","inExprs","inExpr","vid","vids","agg","gen","const","fun","var","INT","DOUBLE","BOOL","'empty'","'V'","'not'","'('","')'","'+'","'-'","'*'","'/'","CMP","'!!'","'&&'","'{'","'}'","'if'","'then'","'else'","'while'","';'","'='","'return'","'minimum'","'maximum'","'sum'","'prod'","'and'","'or'","'<-'","'in'","'nvals'","','","'['","']'","'|'","UPPER","STRING","%eof"]
        bit_start = st * 66
        bit_end = (st + 1) * 66
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..65]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (65) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (7) = happyGoto action_2
action_0 (25) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (65) = happyShift action_4
action_1 (7) = happyGoto action_2
action_1 (25) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (5) = happyGoto action_7
action_2 _ = happyReduce_2

action_3 (33) = happyShift action_6
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_60

action_5 (66) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (34) = happyShift action_12
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (64) = happyShift action_10
action_7 (65) = happyShift action_11
action_7 (6) = happyGoto action_8
action_7 (26) = happyGoto action_9
action_7 _ = happyReduce_1

action_8 _ = happyReduce_3

action_9 (49) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_62

action_11 (33) = happyShift action_14
action_11 _ = happyReduce_61

action_12 (42) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (44) = happyShift action_46
action_13 (47) = happyShift action_47
action_13 (50) = happyShift action_48
action_13 (64) = happyShift action_10
action_13 (65) = happyShift action_11
action_13 (8) = happyGoto action_43
action_13 (9) = happyGoto action_44
action_13 (26) = happyGoto action_45
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (64) = happyShift action_10
action_14 (65) = happyShift action_11
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
action_15 (42) = happyShift action_33
action_15 (44) = happyShift action_34
action_15 (51) = happyShift action_35
action_15 (52) = happyShift action_36
action_15 (53) = happyShift action_37
action_15 (54) = happyShift action_38
action_15 (55) = happyShift action_39
action_15 (56) = happyShift action_40
action_15 (61) = happyShift action_41
action_15 (64) = happyShift action_10
action_15 (65) = happyShift action_11
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

action_16 (48) = happyShift action_72
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_13

action_18 (35) = happyShift action_65
action_18 (36) = happyShift action_66
action_18 (37) = happyShift action_67
action_18 (38) = happyShift action_68
action_18 (39) = happyShift action_69
action_18 (40) = happyShift action_70
action_18 (41) = happyShift action_71
action_18 _ = happyReduce_16

action_19 _ = happyReduce_24

action_20 _ = happyReduce_27

action_21 _ = happyReduce_32

action_22 (61) = happyShift action_64
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_33

action_24 _ = happyReduce_35

action_25 _ = happyReduce_55

action_26 _ = happyReduce_56

action_27 _ = happyReduce_57

action_28 _ = happyReduce_59

action_29 _ = happyReduce_58

action_30 (27) = happyShift action_25
action_30 (28) = happyShift action_26
action_30 (29) = happyShift action_27
action_30 (30) = happyShift action_28
action_30 (31) = happyShift action_29
action_30 (33) = happyShift action_31
action_30 (42) = happyShift action_33
action_30 (51) = happyShift action_35
action_30 (52) = happyShift action_36
action_30 (53) = happyShift action_37
action_30 (54) = happyShift action_38
action_30 (55) = happyShift action_39
action_30 (56) = happyShift action_40
action_30 (61) = happyShift action_41
action_30 (64) = happyShift action_10
action_30 (65) = happyShift action_11
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
action_31 (42) = happyShift action_33
action_31 (44) = happyShift action_34
action_31 (51) = happyShift action_35
action_31 (52) = happyShift action_36
action_31 (53) = happyShift action_37
action_31 (54) = happyShift action_38
action_31 (55) = happyShift action_39
action_31 (56) = happyShift action_40
action_31 (61) = happyShift action_41
action_31 (64) = happyShift action_10
action_31 (65) = happyShift action_11
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
action_32 (42) = happyShift action_33
action_32 (51) = happyShift action_35
action_32 (52) = happyShift action_36
action_32 (53) = happyShift action_37
action_32 (54) = happyShift action_38
action_32 (55) = happyShift action_39
action_32 (56) = happyShift action_40
action_32 (61) = happyShift action_41
action_32 (64) = happyShift action_10
action_32 (65) = happyShift action_11
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
action_33 (42) = happyShift action_33
action_33 (51) = happyShift action_35
action_33 (52) = happyShift action_36
action_33 (53) = happyShift action_37
action_33 (54) = happyShift action_38
action_33 (55) = happyShift action_39
action_33 (56) = happyShift action_40
action_33 (61) = happyShift action_41
action_33 (64) = happyShift action_10
action_33 (65) = happyShift action_11
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

action_35 _ = happyReduce_47

action_36 _ = happyReduce_48

action_37 _ = happyReduce_49

action_38 _ = happyReduce_50

action_39 _ = happyReduce_51

action_40 _ = happyReduce_52

action_41 (27) = happyShift action_58
action_41 (20) = happyGoto action_56
action_41 (21) = happyGoto action_57
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (34) = happyShift action_55
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (43) = happyShift action_54
action_43 (44) = happyShift action_46
action_43 (47) = happyShift action_47
action_43 (50) = happyShift action_48
action_43 (64) = happyShift action_10
action_43 (65) = happyShift action_11
action_43 (9) = happyGoto action_53
action_43 (26) = happyGoto action_45
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_6

action_45 (49) = happyShift action_52
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (33) = happyShift action_51
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (33) = happyShift action_50
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (64) = happyShift action_10
action_48 (65) = happyShift action_11
action_48 (26) = happyGoto action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (48) = happyShift action_90
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (27) = happyShift action_25
action_50 (28) = happyShift action_26
action_50 (29) = happyShift action_27
action_50 (30) = happyShift action_28
action_50 (31) = happyShift action_29
action_50 (32) = happyShift action_30
action_50 (33) = happyShift action_31
action_50 (36) = happyShift action_32
action_50 (42) = happyShift action_33
action_50 (44) = happyShift action_34
action_50 (51) = happyShift action_35
action_50 (52) = happyShift action_36
action_50 (53) = happyShift action_37
action_50 (54) = happyShift action_38
action_50 (55) = happyShift action_39
action_50 (56) = happyShift action_40
action_50 (61) = happyShift action_41
action_50 (64) = happyShift action_10
action_50 (65) = happyShift action_11
action_50 (10) = happyGoto action_89
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
action_51 (42) = happyShift action_33
action_51 (44) = happyShift action_34
action_51 (51) = happyShift action_35
action_51 (52) = happyShift action_36
action_51 (53) = happyShift action_37
action_51 (54) = happyShift action_38
action_51 (55) = happyShift action_39
action_51 (56) = happyShift action_40
action_51 (61) = happyShift action_41
action_51 (64) = happyShift action_10
action_51 (65) = happyShift action_11
action_51 (10) = happyGoto action_88
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
action_52 (42) = happyShift action_33
action_52 (44) = happyShift action_34
action_52 (51) = happyShift action_35
action_52 (52) = happyShift action_36
action_52 (53) = happyShift action_37
action_52 (54) = happyShift action_38
action_52 (55) = happyShift action_39
action_52 (56) = happyShift action_40
action_52 (61) = happyShift action_41
action_52 (64) = happyShift action_10
action_52 (65) = happyShift action_11
action_52 (10) = happyGoto action_87
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

action_55 _ = happyReduce_63

action_56 _ = happyReduce_46

action_57 (60) = happyShift action_85
action_57 (62) = happyShift action_86
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_44

action_59 (27) = happyShift action_25
action_59 (28) = happyShift action_26
action_59 (29) = happyShift action_27
action_59 (30) = happyShift action_28
action_59 (31) = happyShift action_29
action_59 (32) = happyShift action_30
action_59 (33) = happyShift action_31
action_59 (36) = happyShift action_32
action_59 (42) = happyShift action_33
action_59 (51) = happyShift action_35
action_59 (52) = happyShift action_36
action_59 (53) = happyShift action_37
action_59 (54) = happyShift action_38
action_59 (55) = happyShift action_39
action_59 (56) = happyShift action_40
action_59 (61) = happyShift action_41
action_59 (64) = happyShift action_10
action_59 (65) = happyShift action_11
action_59 (12) = happyGoto action_84
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
action_60 (43) = happyShift action_82
action_60 (63) = happyShift action_83
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_25

action_62 (34) = happyShift action_81
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_26

action_64 (27) = happyShift action_25
action_64 (28) = happyShift action_26
action_64 (29) = happyShift action_27
action_64 (30) = happyShift action_28
action_64 (31) = happyShift action_29
action_64 (32) = happyShift action_30
action_64 (33) = happyShift action_31
action_64 (36) = happyShift action_32
action_64 (42) = happyShift action_33
action_64 (44) = happyShift action_34
action_64 (51) = happyShift action_35
action_64 (52) = happyShift action_36
action_64 (53) = happyShift action_37
action_64 (54) = happyShift action_38
action_64 (55) = happyShift action_39
action_64 (56) = happyShift action_40
action_64 (61) = happyShift action_41
action_64 (64) = happyShift action_10
action_64 (65) = happyShift action_11
action_64 (10) = happyGoto action_80
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
action_65 (42) = happyShift action_33
action_65 (51) = happyShift action_35
action_65 (52) = happyShift action_36
action_65 (53) = happyShift action_37
action_65 (54) = happyShift action_38
action_65 (55) = happyShift action_39
action_65 (56) = happyShift action_40
action_65 (61) = happyShift action_41
action_65 (64) = happyShift action_10
action_65 (65) = happyShift action_11
action_65 (12) = happyGoto action_79
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
action_66 (42) = happyShift action_33
action_66 (51) = happyShift action_35
action_66 (52) = happyShift action_36
action_66 (53) = happyShift action_37
action_66 (54) = happyShift action_38
action_66 (55) = happyShift action_39
action_66 (56) = happyShift action_40
action_66 (61) = happyShift action_41
action_66 (64) = happyShift action_10
action_66 (65) = happyShift action_11
action_66 (12) = happyGoto action_78
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
action_67 (42) = happyShift action_33
action_67 (51) = happyShift action_35
action_67 (52) = happyShift action_36
action_67 (53) = happyShift action_37
action_67 (54) = happyShift action_38
action_67 (55) = happyShift action_39
action_67 (56) = happyShift action_40
action_67 (61) = happyShift action_41
action_67 (64) = happyShift action_10
action_67 (65) = happyShift action_11
action_67 (12) = happyGoto action_77
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
action_68 (42) = happyShift action_33
action_68 (51) = happyShift action_35
action_68 (52) = happyShift action_36
action_68 (53) = happyShift action_37
action_68 (54) = happyShift action_38
action_68 (55) = happyShift action_39
action_68 (56) = happyShift action_40
action_68 (61) = happyShift action_41
action_68 (64) = happyShift action_10
action_68 (65) = happyShift action_11
action_68 (12) = happyGoto action_76
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
action_69 (42) = happyShift action_33
action_69 (51) = happyShift action_35
action_69 (52) = happyShift action_36
action_69 (53) = happyShift action_37
action_69 (54) = happyShift action_38
action_69 (55) = happyShift action_39
action_69 (56) = happyShift action_40
action_69 (61) = happyShift action_41
action_69 (64) = happyShift action_10
action_69 (65) = happyShift action_11
action_69 (12) = happyGoto action_75
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
action_70 (42) = happyShift action_33
action_70 (51) = happyShift action_35
action_70 (52) = happyShift action_36
action_70 (53) = happyShift action_37
action_70 (54) = happyShift action_38
action_70 (55) = happyShift action_39
action_70 (56) = happyShift action_40
action_70 (61) = happyShift action_41
action_70 (64) = happyShift action_10
action_70 (65) = happyShift action_11
action_70 (12) = happyGoto action_74
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
action_71 (42) = happyShift action_33
action_71 (51) = happyShift action_35
action_71 (52) = happyShift action_36
action_71 (53) = happyShift action_37
action_71 (54) = happyShift action_38
action_71 (55) = happyShift action_39
action_71 (56) = happyShift action_40
action_71 (61) = happyShift action_41
action_71 (64) = happyShift action_10
action_71 (65) = happyShift action_11
action_71 (12) = happyGoto action_73
action_71 (13) = happyGoto action_19
action_71 (14) = happyGoto action_20
action_71 (15) = happyGoto action_21
action_71 (22) = happyGoto action_22
action_71 (24) = happyGoto action_23
action_71 (26) = happyGoto action_24
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_4

action_73 (35) = happyShift action_65
action_73 (36) = happyShift action_66
action_73 (37) = happyShift action_67
action_73 (38) = happyShift action_68
action_73 (39) = happyShift action_69
action_73 _ = happyReduce_18

action_74 (35) = happyShift action_65
action_74 (36) = happyShift action_66
action_74 (37) = happyShift action_67
action_74 (38) = happyShift action_68
action_74 (39) = happyShift action_69
action_74 (41) = happyShift action_71
action_74 _ = happyReduce_17

action_75 (35) = happyShift action_65
action_75 (36) = happyShift action_66
action_75 (37) = happyShift action_67
action_75 (38) = happyShift action_68
action_75 (39) = happyFail []
action_75 _ = happyReduce_19

action_76 _ = happyReduce_23

action_77 _ = happyReduce_22

action_78 (37) = happyShift action_67
action_78 (38) = happyShift action_68
action_78 _ = happyReduce_21

action_79 (37) = happyShift action_67
action_79 (38) = happyShift action_68
action_79 _ = happyReduce_20

action_80 (63) = happyShift action_98
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_34

action_82 _ = happyReduce_30

action_83 (33) = happyShift action_97
action_83 (64) = happyShift action_10
action_83 (65) = happyShift action_11
action_83 (26) = happyGoto action_96
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (34) = happyShift action_95
action_84 (35) = happyShift action_65
action_84 (36) = happyShift action_66
action_84 (37) = happyShift action_67
action_84 (38) = happyShift action_68
action_84 (39) = happyShift action_69
action_84 (40) = happyShift action_70
action_84 (41) = happyShift action_71
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (27) = happyShift action_58
action_85 (20) = happyGoto action_94
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_36

action_87 (48) = happyShift action_93
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (34) = happyShift action_92
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (34) = happyShift action_91
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_12

action_91 (42) = happyShift action_106
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (45) = happyShift action_105
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_8

action_94 _ = happyReduce_45

action_95 (45) = happyShift action_104
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (57) = happyShift action_103
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (64) = happyShift action_10
action_97 (65) = happyShift action_11
action_97 (16) = happyGoto action_101
action_97 (26) = happyGoto action_102
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (64) = happyShift action_10
action_98 (65) = happyShift action_11
action_98 (23) = happyGoto action_99
action_98 (26) = happyGoto action_100
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (18) = happyGoto action_114
action_99 _ = happyReduce_41

action_100 (57) = happyShift action_113
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (34) = happyShift action_111
action_101 (60) = happyShift action_112
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_37

action_103 (27) = happyShift action_25
action_103 (28) = happyShift action_26
action_103 (29) = happyShift action_27
action_103 (30) = happyShift action_28
action_103 (31) = happyShift action_29
action_103 (33) = happyShift action_31
action_103 (61) = happyShift action_41
action_103 (64) = happyShift action_10
action_103 (65) = happyShift action_11
action_103 (15) = happyGoto action_110
action_103 (24) = happyGoto action_23
action_103 (26) = happyGoto action_24
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (42) = happyShift action_109
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (42) = happyShift action_108
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (44) = happyShift action_46
action_106 (47) = happyShift action_47
action_106 (50) = happyShift action_48
action_106 (64) = happyShift action_10
action_106 (65) = happyShift action_11
action_106 (8) = happyGoto action_107
action_106 (9) = happyGoto action_44
action_106 (26) = happyGoto action_45
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (43) = happyShift action_124
action_107 (44) = happyShift action_46
action_107 (47) = happyShift action_47
action_107 (50) = happyShift action_48
action_107 (64) = happyShift action_10
action_107 (65) = happyShift action_11
action_107 (9) = happyGoto action_53
action_107 (26) = happyGoto action_45
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (44) = happyShift action_46
action_108 (47) = happyShift action_47
action_108 (50) = happyShift action_48
action_108 (64) = happyShift action_10
action_108 (65) = happyShift action_11
action_108 (8) = happyGoto action_123
action_108 (9) = happyGoto action_44
action_108 (26) = happyGoto action_45
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (27) = happyShift action_25
action_109 (28) = happyShift action_26
action_109 (29) = happyShift action_27
action_109 (30) = happyShift action_28
action_109 (31) = happyShift action_29
action_109 (32) = happyShift action_30
action_109 (33) = happyShift action_31
action_109 (36) = happyShift action_32
action_109 (42) = happyShift action_33
action_109 (51) = happyShift action_35
action_109 (52) = happyShift action_36
action_109 (53) = happyShift action_37
action_109 (54) = happyShift action_38
action_109 (55) = happyShift action_39
action_109 (56) = happyShift action_40
action_109 (61) = happyShift action_41
action_109 (64) = happyShift action_10
action_109 (65) = happyShift action_11
action_109 (12) = happyGoto action_122
action_109 (13) = happyGoto action_19
action_109 (14) = happyGoto action_20
action_109 (15) = happyGoto action_21
action_109 (22) = happyGoto action_22
action_109 (24) = happyGoto action_23
action_109 (26) = happyGoto action_24
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (43) = happyShift action_121
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (57) = happyShift action_120
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (64) = happyShift action_10
action_112 (65) = happyShift action_11
action_112 (26) = happyGoto action_119
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (27) = happyShift action_25
action_113 (28) = happyShift action_26
action_113 (29) = happyShift action_27
action_113 (30) = happyShift action_28
action_113 (31) = happyShift action_29
action_113 (33) = happyShift action_31
action_113 (42) = happyShift action_33
action_113 (51) = happyShift action_35
action_113 (52) = happyShift action_36
action_113 (53) = happyShift action_37
action_113 (54) = happyShift action_38
action_113 (55) = happyShift action_39
action_113 (56) = happyShift action_40
action_113 (59) = happyShift action_118
action_113 (61) = happyShift action_41
action_113 (64) = happyShift action_10
action_113 (65) = happyShift action_11
action_113 (14) = happyGoto action_117
action_113 (15) = happyGoto action_21
action_113 (22) = happyGoto action_22
action_113 (24) = happyGoto action_23
action_113 (26) = happyGoto action_24
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (60) = happyShift action_115
action_114 (62) = happyShift action_116
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (64) = happyShift action_10
action_115 (65) = happyShift action_11
action_115 (19) = happyGoto action_129
action_115 (26) = happyGoto action_130
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_31

action_117 _ = happyReduce_54

action_118 (27) = happyShift action_25
action_118 (28) = happyShift action_26
action_118 (29) = happyShift action_27
action_118 (30) = happyShift action_28
action_118 (31) = happyShift action_29
action_118 (33) = happyShift action_31
action_118 (42) = happyShift action_33
action_118 (51) = happyShift action_35
action_118 (52) = happyShift action_36
action_118 (53) = happyShift action_37
action_118 (54) = happyShift action_38
action_118 (55) = happyShift action_39
action_118 (56) = happyShift action_40
action_118 (61) = happyShift action_41
action_118 (64) = happyShift action_10
action_118 (65) = happyShift action_11
action_118 (14) = happyGoto action_128
action_118 (15) = happyGoto action_21
action_118 (22) = happyGoto action_22
action_118 (24) = happyGoto action_23
action_118 (26) = happyGoto action_24
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_38

action_120 (33) = happyShift action_127
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_29

action_122 (35) = happyShift action_65
action_122 (36) = happyShift action_66
action_122 (37) = happyShift action_67
action_122 (38) = happyShift action_68
action_122 (39) = happyShift action_69
action_122 (40) = happyShift action_70
action_122 (41) = happyShift action_71
action_122 (43) = happyShift action_126
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (43) = happyShift action_125
action_123 (44) = happyShift action_46
action_123 (47) = happyShift action_47
action_123 (50) = happyShift action_48
action_123 (64) = happyShift action_10
action_123 (65) = happyShift action_11
action_123 (9) = happyGoto action_53
action_123 (26) = happyGoto action_45
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_11

action_125 (46) = happyShift action_135
action_125 _ = happyReduce_10

action_126 (46) = happyShift action_134
action_126 _ = happyReduce_15

action_127 (27) = happyShift action_25
action_127 (28) = happyShift action_26
action_127 (29) = happyShift action_27
action_127 (30) = happyShift action_28
action_127 (31) = happyShift action_29
action_127 (33) = happyShift action_31
action_127 (61) = happyShift action_41
action_127 (64) = happyShift action_10
action_127 (65) = happyShift action_11
action_127 (15) = happyGoto action_132
action_127 (17) = happyGoto action_133
action_127 (24) = happyGoto action_23
action_127 (26) = happyGoto action_24
action_127 _ = happyFail (happyExpListPerState 127)

action_128 _ = happyReduce_53

action_129 _ = happyReduce_42

action_130 (58) = happyShift action_131
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (27) = happyShift action_25
action_131 (28) = happyShift action_26
action_131 (29) = happyShift action_27
action_131 (30) = happyShift action_28
action_131 (31) = happyShift action_29
action_131 (32) = happyShift action_30
action_131 (33) = happyShift action_31
action_131 (36) = happyShift action_32
action_131 (42) = happyShift action_33
action_131 (44) = happyShift action_34
action_131 (51) = happyShift action_35
action_131 (52) = happyShift action_36
action_131 (53) = happyShift action_37
action_131 (54) = happyShift action_38
action_131 (55) = happyShift action_39
action_131 (56) = happyShift action_40
action_131 (61) = happyShift action_41
action_131 (64) = happyShift action_10
action_131 (65) = happyShift action_11
action_131 (10) = happyGoto action_140
action_131 (11) = happyGoto action_17
action_131 (12) = happyGoto action_18
action_131 (13) = happyGoto action_19
action_131 (14) = happyGoto action_20
action_131 (15) = happyGoto action_21
action_131 (22) = happyGoto action_22
action_131 (24) = happyGoto action_23
action_131 (26) = happyGoto action_24
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_39

action_133 (34) = happyShift action_138
action_133 (60) = happyShift action_139
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (42) = happyShift action_137
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (42) = happyShift action_136
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (44) = happyShift action_46
action_136 (47) = happyShift action_47
action_136 (50) = happyShift action_48
action_136 (64) = happyShift action_10
action_136 (65) = happyShift action_11
action_136 (8) = happyGoto action_144
action_136 (9) = happyGoto action_44
action_136 (26) = happyGoto action_45
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (27) = happyShift action_25
action_137 (28) = happyShift action_26
action_137 (29) = happyShift action_27
action_137 (30) = happyShift action_28
action_137 (31) = happyShift action_29
action_137 (32) = happyShift action_30
action_137 (33) = happyShift action_31
action_137 (36) = happyShift action_32
action_137 (42) = happyShift action_33
action_137 (51) = happyShift action_35
action_137 (52) = happyShift action_36
action_137 (53) = happyShift action_37
action_137 (54) = happyShift action_38
action_137 (55) = happyShift action_39
action_137 (56) = happyShift action_40
action_137 (61) = happyShift action_41
action_137 (64) = happyShift action_10
action_137 (65) = happyShift action_11
action_137 (12) = happyGoto action_143
action_137 (13) = happyGoto action_19
action_137 (14) = happyGoto action_20
action_137 (15) = happyGoto action_21
action_137 (22) = happyGoto action_22
action_137 (24) = happyGoto action_23
action_137 (26) = happyGoto action_24
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (43) = happyShift action_142
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (27) = happyShift action_25
action_139 (28) = happyShift action_26
action_139 (29) = happyShift action_27
action_139 (30) = happyShift action_28
action_139 (31) = happyShift action_29
action_139 (33) = happyShift action_31
action_139 (61) = happyShift action_41
action_139 (64) = happyShift action_10
action_139 (65) = happyShift action_11
action_139 (15) = happyGoto action_141
action_139 (24) = happyGoto action_23
action_139 (26) = happyGoto action_24
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_43

action_141 _ = happyReduce_40

action_142 _ = happyReduce_28

action_143 (35) = happyShift action_65
action_143 (36) = happyShift action_66
action_143 (37) = happyShift action_67
action_143 (38) = happyShift action_68
action_143 (39) = happyShift action_69
action_143 (40) = happyShift action_70
action_143 (41) = happyShift action_71
action_143 (43) = happyShift action_146
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (43) = happyShift action_145
action_144 (44) = happyShift action_46
action_144 (47) = happyShift action_47
action_144 (50) = happyShift action_48
action_144 (64) = happyShift action_10
action_144 (65) = happyShift action_11
action_144 (9) = happyGoto action_53
action_144 (26) = happyGoto action_45
action_144 _ = happyFail (happyExpListPerState 144)

action_145 _ = happyReduce_9

action_146 _ = happyReduce_14

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
		 (DVarDef happy_var_1 happy_var_3 None
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
		 (DLoopDef happy_var_3 (reverse happy_var_6) None 0 []
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (DReturnDef happy_var_2 None
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
	(HappyTerminal (TokenCmp happy_var_2))
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp happy_var_2) [happy_var_1, happy_var_3] None
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "+") [happy_var_1, happy_var_3] None
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "-") [happy_var_1, happy_var_3] None
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "*") [happy_var_1, happy_var_3] None
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "/") [happy_var_1, happy_var_3] None
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  13 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (DFunAp (DFun "neg" ) [happy_var_2] None
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  13 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (DFunAp (DFun "not" ) [happy_var_2] None
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happyReduce 11 14 happyReduction_28
happyReduction_28 (_ `HappyStk`
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
		 (DCmprhnsnExp happy_var_2 (zip (reverse happy_var_5) (reverse happy_var_9))
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 7 14 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (DCmprhnsnExp happy_var_2 [(happy_var_4,happy_var_6)]
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (DCmprhnsnExp happy_var_2 []
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 7 14 happyReduction_31
happyReduction_31 (_ `HappyStk`
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

happyReduce_32 = happySpecReduce_1  14 happyReduction_32
happyReduction_32 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  15 happyReduction_33
happyReduction_33 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn15
		 (DCExp happy_var_1 None
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  15 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn15
		 (DVExp happy_var_1 None
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  15 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (DChoiceVID (reverse happy_var_2) DTBool
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  16 happyReduction_37
happyReduction_37 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 ([ happy_var_1 ]
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  16 happyReduction_38
happyReduction_38 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_3 : happy_var_1
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn17
		 ([ happy_var_1 ]
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  17 happyReduction_40
happyReduction_40 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_3 : happy_var_1
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_0  18 happyReduction_41
happyReduction_41  =  HappyAbsSyn18
		 ([]
	)

happyReduce_42 = happySpecReduce_3  18 happyReduction_42
happyReduction_42 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_3 : happy_var_1
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  19 happyReduction_43
happyReduction_43 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn19
		 (DIn happy_var_1 happy_var_3 None
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  20 happyReduction_44
happyReduction_44 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  21 happyReduction_45
happyReduction_45 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_3 : happy_var_1
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  21 happyReduction_46
happyReduction_46 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 ([ happy_var_1 ]
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  22 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn22
		 (DAggMin
	)

happyReduce_48 = happySpecReduce_1  22 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn22
		 (DAggMax
	)

happyReduce_49 = happySpecReduce_1  22 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn22
		 (DAggSum
	)

happyReduce_50 = happySpecReduce_1  22 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn22
		 (DAggProd
	)

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn22
		 (DAggAnd
	)

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn22
		 (DAggOr
	)

happyReduce_53 = happyReduce 4 23 happyReduction_53
happyReduction_53 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (if (happy_var_4 == (DCExp DCAllV None)) then ( DGenNvalsV happy_var_1 DCAllV  None ) else ( DGenNvals happy_var_1 happy_var_4 None )
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_3  23 happyReduction_54
happyReduction_54 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn23
		 (if (happy_var_3 == (DCExp DCAllV None)) then ( DGenGV happy_var_1 DCAllV  None ) else ( DGenG happy_var_1 happy_var_3 None )
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  24 happyReduction_55
happyReduction_55 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn24
		 (DCInt happy_var_1 DTInt
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  24 happyReduction_56
happyReduction_56 (HappyTerminal (TokenDouble happy_var_1))
	 =  HappyAbsSyn24
		 (DCDouble happy_var_1 DTDouble
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  24 happyReduction_57
happyReduction_57 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn24
		 (DCBool happy_var_1 DTBool
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  24 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn24
		 (DCAllV
	)

happyReduce_59 = happySpecReduce_1  24 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn24
		 (DCEmpty
	)

happyReduce_60 = happySpecReduce_1  25 happyReduction_60
happyReduction_60 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn25
		 (DFun happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  26 happyReduction_61
happyReduction_61 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn26
		 (DVar happy_var_1 0 None
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  26 happyReduction_62
happyReduction_62 (HappyTerminal (TokenUpper happy_var_1))
	 =  HappyAbsSyn26
		 (DVarV happy_var_1 0
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happyReduce 4 26 happyReduction_63
happyReduction_63 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (DFunV happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 66 66 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 27;
	TokenDouble happy_dollar_dollar -> cont 28;
	TokenBool happy_dollar_dollar -> cont 29;
	TokenEmpty -> cont 30;
	TokenV -> cont 31;
	TokenNot -> cont 32;
	TokenLParen -> cont 33;
	TokenRParen -> cont 34;
	TokenPlus -> cont 35;
	TokenMinus -> cont 36;
	TokenMul -> cont 37;
	TokenDev -> cont 38;
	TokenCmp happy_dollar_dollar -> cont 39;
	TokenOr -> cont 40;
	TokenAnd -> cont 41;
	TokenLCurly -> cont 42;
	TokenRCurly -> cont 43;
	TokenIf -> cont 44;
	TokenThen -> cont 45;
	TokenElse -> cont 46;
	TokenWhile -> cont 47;
	TokenSemiColon -> cont 48;
	TokenEqual -> cont 49;
	TokenReturn -> cont 50;
	TokenAggMin -> cont 51;
	TokenAggMax -> cont 52;
	TokenAggSum -> cont 53;
	TokenAggProd -> cont 54;
	TokenAggAnd -> cont 55;
	TokenAggOr -> cont 56;
	TokenLArrow -> cont 57;
	TokenIn -> cont 58;
	TokenNvals -> cont 59;
	TokenComma -> cont 60;
	TokenLBrack -> cont 61;
	TokenRBrack -> cont 62;
	TokenVbar -> cont 63;
	TokenUpper happy_dollar_dollar -> cont 64;
	TokenString happy_dollar_dollar -> cont 65;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 66 tk tks = happyError' (tks, explist)
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
