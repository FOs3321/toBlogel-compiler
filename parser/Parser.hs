{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import Spec
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,262) ([0,0,2048,0,0,256,0,0,0,32768,0,0,0,0,0,0,0,0,128,0,0,0,96,0,0,0,0,8192,0,0,0,0,128,0,0,8192,0,0,36864,28,0,0,3,20448,64,0,0,128,0,0,0,0,2032,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,23,0,63488,4115,0,24320,0,0,2048,0,0,512,0,0,32768,457,0,0,0,0,32768,0,4096,0,0,512,0,0,0,768,0,0,4,64512,2057,0,16256,257,0,10224,32,0,0,0,0,0,0,0,0,0,32512,2,0,0,0,0,512,0,0,0,0,61440,39,0,65024,4,0,40896,0,0,5112,0,0,639,0,57344,79,0,64512,9,0,0,0,0,61440,1,0,48640,0,0,960,0,0,0,0,0,0,0,32768,1,0,12288,0,0,0,0,0,2040,0,0,16384,0,8192,0,0,1024,0,0,0,0,0,4096,0,0,4096,0,0,0,0,0,64,0,0,1,0,8192,0,0,36864,28,0,37632,3,0,29248,0,2556,0,0,49024,0,0,12288,57,0,0,0,0,512,0,0,64,0,32768,0,0,4096,0,0,18432,14,16256,1,0,61440,23,0,0,1830,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","programSpec","funDefs","funDef","mainDef","statements","statement","expr","expr4","expr3","expr2","expr1","expr0","const","fun","var","INT","DOUBLE","BOOL","\"empty\"","'V'","\"not\"","'('","')'","'+'","'-'","'*'","'/'","CMP","\"!!\"","\"&&\"","'{'","'}'","\"if\"","\"then\"","\"else\"","\"while\"","';'","'='","\"return\"","UPPER","STRING","%eof"]
        bit_start = st * 45
        bit_end = (st + 1) * 45
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..44]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (44) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (7) = happyGoto action_2
action_0 (17) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (44) = happyShift action_4
action_1 (7) = happyGoto action_2
action_1 (17) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (5) = happyGoto action_7
action_2 _ = happyReduce_2

action_3 (25) = happyShift action_6
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_36

action_5 (45) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (26) = happyShift action_12
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (43) = happyShift action_10
action_7 (44) = happyShift action_11
action_7 (6) = happyGoto action_8
action_7 (18) = happyGoto action_9
action_7 _ = happyReduce_1

action_8 _ = happyReduce_3

action_9 (41) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_38

action_11 (25) = happyShift action_14
action_11 _ = happyReduce_37

action_12 (34) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (36) = happyShift action_36
action_13 (39) = happyShift action_37
action_13 (42) = happyShift action_38
action_13 (43) = happyShift action_10
action_13 (44) = happyShift action_11
action_13 (8) = happyGoto action_33
action_13 (9) = happyGoto action_34
action_13 (18) = happyGoto action_35
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (43) = happyShift action_10
action_14 (44) = happyShift action_11
action_14 (18) = happyGoto action_32
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (19) = happyShift action_23
action_15 (20) = happyShift action_24
action_15 (21) = happyShift action_25
action_15 (22) = happyShift action_26
action_15 (23) = happyShift action_27
action_15 (24) = happyShift action_28
action_15 (25) = happyShift action_29
action_15 (28) = happyShift action_30
action_15 (36) = happyShift action_31
action_15 (10) = happyGoto action_16
action_15 (11) = happyGoto action_17
action_15 (12) = happyGoto action_18
action_15 (13) = happyGoto action_19
action_15 (14) = happyGoto action_20
action_15 (15) = happyGoto action_21
action_15 (16) = happyGoto action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (40) = happyShift action_57
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_13

action_18 (27) = happyShift action_50
action_18 (28) = happyShift action_51
action_18 (29) = happyShift action_52
action_18 (30) = happyShift action_53
action_18 (31) = happyShift action_54
action_18 (32) = happyShift action_55
action_18 (33) = happyShift action_56
action_18 _ = happyReduce_16

action_19 _ = happyReduce_24

action_20 _ = happyReduce_27

action_21 _ = happyReduce_28

action_22 _ = happyReduce_29

action_23 _ = happyReduce_31

action_24 _ = happyReduce_32

action_25 _ = happyReduce_33

action_26 _ = happyReduce_35

action_27 _ = happyReduce_34

action_28 (19) = happyShift action_23
action_28 (20) = happyShift action_24
action_28 (21) = happyShift action_25
action_28 (22) = happyShift action_26
action_28 (23) = happyShift action_27
action_28 (25) = happyShift action_29
action_28 (14) = happyGoto action_49
action_28 (15) = happyGoto action_21
action_28 (16) = happyGoto action_22
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (19) = happyShift action_23
action_29 (20) = happyShift action_24
action_29 (21) = happyShift action_25
action_29 (22) = happyShift action_26
action_29 (23) = happyShift action_27
action_29 (24) = happyShift action_28
action_29 (25) = happyShift action_29
action_29 (28) = happyShift action_30
action_29 (36) = happyShift action_31
action_29 (10) = happyGoto action_48
action_29 (11) = happyGoto action_17
action_29 (12) = happyGoto action_18
action_29 (13) = happyGoto action_19
action_29 (14) = happyGoto action_20
action_29 (15) = happyGoto action_21
action_29 (16) = happyGoto action_22
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (19) = happyShift action_23
action_30 (20) = happyShift action_24
action_30 (21) = happyShift action_25
action_30 (22) = happyShift action_26
action_30 (23) = happyShift action_27
action_30 (25) = happyShift action_29
action_30 (14) = happyGoto action_47
action_30 (15) = happyGoto action_21
action_30 (16) = happyGoto action_22
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (25) = happyShift action_46
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (26) = happyShift action_45
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (35) = happyShift action_44
action_33 (36) = happyShift action_36
action_33 (39) = happyShift action_37
action_33 (42) = happyShift action_38
action_33 (43) = happyShift action_10
action_33 (44) = happyShift action_11
action_33 (9) = happyGoto action_43
action_33 (18) = happyGoto action_35
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_6

action_35 (41) = happyShift action_42
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (25) = happyShift action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (25) = happyShift action_40
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (43) = happyShift action_10
action_38 (44) = happyShift action_11
action_38 (18) = happyGoto action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (40) = happyShift action_70
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (19) = happyShift action_23
action_40 (20) = happyShift action_24
action_40 (21) = happyShift action_25
action_40 (22) = happyShift action_26
action_40 (23) = happyShift action_27
action_40 (24) = happyShift action_28
action_40 (25) = happyShift action_29
action_40 (28) = happyShift action_30
action_40 (36) = happyShift action_31
action_40 (10) = happyGoto action_69
action_40 (11) = happyGoto action_17
action_40 (12) = happyGoto action_18
action_40 (13) = happyGoto action_19
action_40 (14) = happyGoto action_20
action_40 (15) = happyGoto action_21
action_40 (16) = happyGoto action_22
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (19) = happyShift action_23
action_41 (20) = happyShift action_24
action_41 (21) = happyShift action_25
action_41 (22) = happyShift action_26
action_41 (23) = happyShift action_27
action_41 (24) = happyShift action_28
action_41 (25) = happyShift action_29
action_41 (28) = happyShift action_30
action_41 (36) = happyShift action_31
action_41 (10) = happyGoto action_68
action_41 (11) = happyGoto action_17
action_41 (12) = happyGoto action_18
action_41 (13) = happyGoto action_19
action_41 (14) = happyGoto action_20
action_41 (15) = happyGoto action_21
action_41 (16) = happyGoto action_22
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (19) = happyShift action_23
action_42 (20) = happyShift action_24
action_42 (21) = happyShift action_25
action_42 (22) = happyShift action_26
action_42 (23) = happyShift action_27
action_42 (24) = happyShift action_28
action_42 (25) = happyShift action_29
action_42 (28) = happyShift action_30
action_42 (36) = happyShift action_31
action_42 (10) = happyGoto action_67
action_42 (11) = happyGoto action_17
action_42 (12) = happyGoto action_18
action_42 (13) = happyGoto action_19
action_42 (14) = happyGoto action_20
action_42 (15) = happyGoto action_21
action_42 (16) = happyGoto action_22
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_7

action_44 _ = happyReduce_5

action_45 _ = happyReduce_39

action_46 (19) = happyShift action_23
action_46 (20) = happyShift action_24
action_46 (21) = happyShift action_25
action_46 (22) = happyShift action_26
action_46 (23) = happyShift action_27
action_46 (24) = happyShift action_28
action_46 (25) = happyShift action_29
action_46 (28) = happyShift action_30
action_46 (12) = happyGoto action_66
action_46 (13) = happyGoto action_19
action_46 (14) = happyGoto action_20
action_46 (15) = happyGoto action_21
action_46 (16) = happyGoto action_22
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_25

action_48 (26) = happyShift action_65
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_26

action_50 (19) = happyShift action_23
action_50 (20) = happyShift action_24
action_50 (21) = happyShift action_25
action_50 (22) = happyShift action_26
action_50 (23) = happyShift action_27
action_50 (24) = happyShift action_28
action_50 (25) = happyShift action_29
action_50 (28) = happyShift action_30
action_50 (12) = happyGoto action_64
action_50 (13) = happyGoto action_19
action_50 (14) = happyGoto action_20
action_50 (15) = happyGoto action_21
action_50 (16) = happyGoto action_22
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (19) = happyShift action_23
action_51 (20) = happyShift action_24
action_51 (21) = happyShift action_25
action_51 (22) = happyShift action_26
action_51 (23) = happyShift action_27
action_51 (24) = happyShift action_28
action_51 (25) = happyShift action_29
action_51 (28) = happyShift action_30
action_51 (12) = happyGoto action_63
action_51 (13) = happyGoto action_19
action_51 (14) = happyGoto action_20
action_51 (15) = happyGoto action_21
action_51 (16) = happyGoto action_22
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (19) = happyShift action_23
action_52 (20) = happyShift action_24
action_52 (21) = happyShift action_25
action_52 (22) = happyShift action_26
action_52 (23) = happyShift action_27
action_52 (24) = happyShift action_28
action_52 (25) = happyShift action_29
action_52 (28) = happyShift action_30
action_52 (12) = happyGoto action_62
action_52 (13) = happyGoto action_19
action_52 (14) = happyGoto action_20
action_52 (15) = happyGoto action_21
action_52 (16) = happyGoto action_22
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (19) = happyShift action_23
action_53 (20) = happyShift action_24
action_53 (21) = happyShift action_25
action_53 (22) = happyShift action_26
action_53 (23) = happyShift action_27
action_53 (24) = happyShift action_28
action_53 (25) = happyShift action_29
action_53 (28) = happyShift action_30
action_53 (12) = happyGoto action_61
action_53 (13) = happyGoto action_19
action_53 (14) = happyGoto action_20
action_53 (15) = happyGoto action_21
action_53 (16) = happyGoto action_22
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyShift action_23
action_54 (20) = happyShift action_24
action_54 (21) = happyShift action_25
action_54 (22) = happyShift action_26
action_54 (23) = happyShift action_27
action_54 (24) = happyShift action_28
action_54 (25) = happyShift action_29
action_54 (28) = happyShift action_30
action_54 (12) = happyGoto action_60
action_54 (13) = happyGoto action_19
action_54 (14) = happyGoto action_20
action_54 (15) = happyGoto action_21
action_54 (16) = happyGoto action_22
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (19) = happyShift action_23
action_55 (20) = happyShift action_24
action_55 (21) = happyShift action_25
action_55 (22) = happyShift action_26
action_55 (23) = happyShift action_27
action_55 (24) = happyShift action_28
action_55 (25) = happyShift action_29
action_55 (28) = happyShift action_30
action_55 (12) = happyGoto action_59
action_55 (13) = happyGoto action_19
action_55 (14) = happyGoto action_20
action_55 (15) = happyGoto action_21
action_55 (16) = happyGoto action_22
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (19) = happyShift action_23
action_56 (20) = happyShift action_24
action_56 (21) = happyShift action_25
action_56 (22) = happyShift action_26
action_56 (23) = happyShift action_27
action_56 (24) = happyShift action_28
action_56 (25) = happyShift action_29
action_56 (28) = happyShift action_30
action_56 (12) = happyGoto action_58
action_56 (13) = happyGoto action_19
action_56 (14) = happyGoto action_20
action_56 (15) = happyGoto action_21
action_56 (16) = happyGoto action_22
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_4

action_58 (27) = happyShift action_50
action_58 (28) = happyShift action_51
action_58 (29) = happyShift action_52
action_58 (30) = happyShift action_53
action_58 (31) = happyShift action_54
action_58 _ = happyReduce_18

action_59 (27) = happyShift action_50
action_59 (28) = happyShift action_51
action_59 (29) = happyShift action_52
action_59 (30) = happyShift action_53
action_59 (31) = happyShift action_54
action_59 (33) = happyShift action_56
action_59 _ = happyReduce_17

action_60 (27) = happyShift action_50
action_60 (28) = happyShift action_51
action_60 (29) = happyShift action_52
action_60 (30) = happyShift action_53
action_60 _ = happyReduce_19

action_61 _ = happyReduce_23

action_62 _ = happyReduce_22

action_63 (29) = happyShift action_52
action_63 (30) = happyShift action_53
action_63 _ = happyReduce_21

action_64 (29) = happyShift action_52
action_64 (30) = happyShift action_53
action_64 _ = happyReduce_20

action_65 _ = happyReduce_30

action_66 (26) = happyShift action_74
action_66 (27) = happyShift action_50
action_66 (28) = happyShift action_51
action_66 (29) = happyShift action_52
action_66 (30) = happyShift action_53
action_66 (31) = happyShift action_54
action_66 (32) = happyShift action_55
action_66 (33) = happyShift action_56
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (40) = happyShift action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (26) = happyShift action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (26) = happyShift action_71
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_12

action_71 (34) = happyShift action_77
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (37) = happyShift action_76
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_8

action_74 (37) = happyShift action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (34) = happyShift action_80
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (34) = happyShift action_79
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (36) = happyShift action_36
action_77 (39) = happyShift action_37
action_77 (42) = happyShift action_38
action_77 (43) = happyShift action_10
action_77 (44) = happyShift action_11
action_77 (8) = happyGoto action_78
action_77 (9) = happyGoto action_34
action_77 (18) = happyGoto action_35
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (35) = happyShift action_83
action_78 (36) = happyShift action_36
action_78 (39) = happyShift action_37
action_78 (42) = happyShift action_38
action_78 (43) = happyShift action_10
action_78 (44) = happyShift action_11
action_78 (9) = happyGoto action_43
action_78 (18) = happyGoto action_35
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (36) = happyShift action_36
action_79 (39) = happyShift action_37
action_79 (42) = happyShift action_38
action_79 (43) = happyShift action_10
action_79 (44) = happyShift action_11
action_79 (8) = happyGoto action_82
action_79 (9) = happyGoto action_34
action_79 (18) = happyGoto action_35
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (19) = happyShift action_23
action_80 (20) = happyShift action_24
action_80 (21) = happyShift action_25
action_80 (22) = happyShift action_26
action_80 (23) = happyShift action_27
action_80 (24) = happyShift action_28
action_80 (25) = happyShift action_29
action_80 (28) = happyShift action_30
action_80 (12) = happyGoto action_81
action_80 (13) = happyGoto action_19
action_80 (14) = happyGoto action_20
action_80 (15) = happyGoto action_21
action_80 (16) = happyGoto action_22
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (27) = happyShift action_50
action_81 (28) = happyShift action_51
action_81 (29) = happyShift action_52
action_81 (30) = happyShift action_53
action_81 (31) = happyShift action_54
action_81 (32) = happyShift action_55
action_81 (33) = happyShift action_56
action_81 (35) = happyShift action_85
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (35) = happyShift action_84
action_82 (36) = happyShift action_36
action_82 (39) = happyShift action_37
action_82 (42) = happyShift action_38
action_82 (43) = happyShift action_10
action_82 (44) = happyShift action_11
action_82 (9) = happyGoto action_43
action_82 (18) = happyGoto action_35
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_11

action_84 (38) = happyShift action_87
action_84 _ = happyReduce_10

action_85 (38) = happyShift action_86
action_85 _ = happyReduce_15

action_86 (34) = happyShift action_89
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (34) = happyShift action_88
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (36) = happyShift action_36
action_88 (39) = happyShift action_37
action_88 (42) = happyShift action_38
action_88 (43) = happyShift action_10
action_88 (44) = happyShift action_11
action_88 (8) = happyGoto action_91
action_88 (9) = happyGoto action_34
action_88 (18) = happyGoto action_35
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (19) = happyShift action_23
action_89 (20) = happyShift action_24
action_89 (21) = happyShift action_25
action_89 (22) = happyShift action_26
action_89 (23) = happyShift action_27
action_89 (24) = happyShift action_28
action_89 (25) = happyShift action_29
action_89 (28) = happyShift action_30
action_89 (12) = happyGoto action_90
action_89 (13) = happyGoto action_19
action_89 (14) = happyGoto action_20
action_89 (15) = happyGoto action_21
action_89 (16) = happyGoto action_22
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (27) = happyShift action_50
action_90 (28) = happyShift action_51
action_90 (29) = happyShift action_52
action_90 (30) = happyShift action_53
action_90 (31) = happyShift action_54
action_90 (32) = happyShift action_55
action_90 (33) = happyShift action_56
action_90 (35) = happyShift action_93
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (35) = happyShift action_92
action_91 (36) = happyShift action_36
action_91 (39) = happyShift action_37
action_91 (42) = happyShift action_38
action_91 (43) = happyShift action_10
action_91 (44) = happyShift action_11
action_91 (9) = happyGoto action_43
action_91 (18) = happyGoto action_35
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_9

action_93 _ = happyReduce_14

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 (DProgram happy_var_1 happy_var_2
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
	(HappyAbsSyn18  happy_var_1) `HappyStk`
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
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (DMainDef happy_var_1 happy_var_5
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
	(HappyAbsSyn18  happy_var_1) `HappyStk`
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
		 (DIfDef happy_var_3 happy_var_7 happy_var_11
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
		 (DIfDef happy_var_3 happy_var_7 []
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
		 (DLoopDef happy_var_3 happy_var_6 None 0 []
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn18  happy_var_2)
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

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (DCExp happy_var_1 None
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn16
		 (DCInt happy_var_1 DTInt
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  16 happyReduction_32
happyReduction_32 (HappyTerminal (TokenDouble happy_var_1))
	 =  HappyAbsSyn16
		 (DCDouble happy_var_1 DTDouble
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn16
		 (DCBool happy_var_1 DTBool
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn16
		 (DCAllV
	)

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn16
		 (DCEmpty
	)

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn17
		 (DFun happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  18 happyReduction_37
happyReduction_37 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn18
		 (DVar happy_var_1 0 None
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  18 happyReduction_38
happyReduction_38 (HappyTerminal (TokenUpper happy_var_1))
	 =  HappyAbsSyn18
		 (DVarV happy_var_1 0
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 18 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (DFunV happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 45 45 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 19;
	TokenDouble happy_dollar_dollar -> cont 20;
	TokenBool happy_dollar_dollar -> cont 21;
	TokenEmpty -> cont 22;
	TokenV -> cont 23;
	TokenNot -> cont 24;
	TokenLParen -> cont 25;
	TokenRParen -> cont 26;
	TokenPlus -> cont 27;
	TokenMinus -> cont 28;
	TokenMul -> cont 29;
	TokenDev -> cont 30;
	TokenCmp happy_dollar_dollar -> cont 31;
	TokenOr -> cont 32;
	TokenAnd -> cont 33;
	TokenLBrace -> cont 34;
	TokenRBrace -> cont 35;
	TokenIf -> cont 36;
	TokenThen -> cont 37;
	TokenElse -> cont 38;
	TokenWhile -> cont 39;
	TokenSemiColon -> cont 40;
	TokenEqual -> cont 41;
	TokenReturn -> cont 42;
	TokenUpper happy_dollar_dollar -> cont 43;
	TokenString happy_dollar_dollar -> cont 44;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 45 tk tks = happyError' (tks, explist)
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
