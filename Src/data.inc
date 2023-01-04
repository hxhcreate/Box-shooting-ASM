ifndef DATA_INC 
DATA_INC equ <1>

include canvas-utils.inc
.data
;IDD_DIALOG1            EQU         102
;IDR_MENU1              EQU         108
;IDR_ACCELERATOR2       EQU         109
;IDC_NEW                EQU         1007
;IDC_DATE               EQU         1008
;IDC_UP                 EQU         1118
;IDC_DOWN               EQU         1119
;IDC_LEFT               EQU         1120
;IDC_RIGHT              EQU         1121
;IDC_STEP               EQU         1122
;IDC_STEPTEXT           EQU         1123
;IDC_LEVEL              EQU         1124
;IDC_LEVELTEXT          EQU         1125
;IDC_REMAKE             EQU         1126
;ID_NEW                 EQU         40007
;ID_EXIT                EQU         40008
;ID_ABOUT               EQU         40009
;ID_WRITER              EQU         40012
;
;IDC_BLEVEL1            EQU         1130
;IDC_BLEVEL2            EQU         1131
;IDC_BLEVEL3            EQU         1132
;IDC_BLEVEL4            EQU         1133
;IDC_BLEVEL5            EQU         1134
;IDC_BLEVEL6            EQU         1135
;IDC_BLEVEL7            EQU         1136
;IDC_BLEVEL8            EQU         1137
;IDC_BLEVEL9            EQU         1138
;IDC_BLEVEL10           EQU         1139

; from resource.h
IDR_ACCELERATOR1     equ           101
IDD_DIALOG1          equ           102
IDR_MENU1            equ           108
IDR_ACCELERATOR2     equ           109
IDC_BUTTON2          equ           1007
IDC_NEW              equ           1007
IDC_DATETIMEPICKER2  equ           1008
IDC_DATE             equ           1008
IDC_UP               equ           1118
IDC_DOWN             equ           1119
IDC_LEFT             equ           1120
IDC_RIGHT            equ           1121
IDC_STEP             equ           1122
IDC_STEPTEXT         equ           1123
IDC_LEVEL            equ           1124
IDC_LEVELTEXT        equ           1125
IDC_REMAKE           equ           1126
IDC_BLEVEL1          equ           1130
IDC_BLEVEL2          equ           1131
IDC_BLEVEL3          equ           1132
IDC_BLEVEL4          equ           1133
IDC_BLEVEL5          equ           1134
IDC_BLEVEL6          equ           1135
IDC_BLEVEL7          equ           1136
IDC_BLEVEL8          equ           1137
IDC_BLEVEL9          equ           1138
IDC_BLEVEL10         equ           1139

IDC_MODE1            equ           1140
IDC_MODE2            equ           1141
IDC_MODE3            equ           1142
IDC_Modes            equ           1143
IDC_MODETEXT         equ           1127


IDC_SCORE1           equ           1122
IDC_SCORETEXT1       equ           1123
IDC_SCORE2           equ           1147
IDC_SCORETEXT2       equ           1148
IDC_PROGRESS         equ           1144


ID_40004             equ           40004
ID_40005             equ           40005
ID_40006             equ           40006
ID_NEW               equ           40007
ID_EXIT              equ           40008
ID_ABOUT             equ           40009
ID_40010             equ           40010
ID_Wirter            equ           40011
ID_WRITER            equ           40012

IDR_WAVE1					equ		147
IDB_BITMAP_BOMB             equ     113
IDB_BITMAP_BOX              equ     114
IDB_BITMAP_BOX_BROKEN       equ     115
IDB_BITMAP_BRIDGE           equ     116
IDB_BITMAP_EMPTY            equ     117
IDB_BITMAP_FENCE            equ     118
IDB_BITMAP_LEVEL_1          equ     119
IDB_BITMAP_LEVEL_2          equ     120
IDB_BITMAP_LEVEL_3          equ     121
IDB_BITMAP_LEVEL_4          equ     122
IDB_BITMAP_LEVEL_5          equ     123
IDB_BITMAP_LEVEL_6          equ     124
IDB_BITMAP_LEVEL_7          equ     125
IDB_BITMAP_LEVEL_8          equ     126
IDB_BITMAP_LEVEL_9          equ     127
IDB_BITMAP_LEVEL_10         equ     128
IDB_BITMAP_PATH             equ     129
IDB_BITMAP_PLAYER1_DOWN     equ     130
IDB_BITMAP_PLAYER1_HIT      equ     131
IDB_BITMAP_PLAYER1_LEFT     equ     132
IDB_BITMAP_PLAYER1_RIGHT    equ     133
IDB_BITMAP_PLAYER1_UP       equ     134
IDB_BITMAP_PLAYER2_DOWN     equ     135
IDB_BITMAP_PLAYER2_HIT      equ     136
IDB_BITMAP_PLAYER2_LEFT     equ     137
IDB_BITMAP_PLAYER2_RIGHT    equ     138
IDB_BITMAP_PLAYER2_UP       equ     139
IDB_BITMAP_SPLASH           equ     140
IDB_BITMAP_TREASURE         equ     141
IDB_BITMAP_TREE             equ     142
IDB_BITMAP_WALL             equ     143
IDB_BITMAP_WATER            equ     144
IDB_BITMAP_AWARD1           equ     145
IDB_BITMAP_AWARD2           equ     146
IDB_BITMAP_CONTROL          equ     148
IDC_INFO                    equ     1145



;IDC_U2_UP            equ           40029
;IDC_U1_LEFT          equ           40030
;IDC_U1_UP            equ           40031
;IDC_U1_RIGHT         equ           40032
;IDC_U1_DOWN          equ           40033
;IDC_U1_RESTART       equ           40034
;IDC_U2_LEFT          equ           40036
;IDC_U2_RIGHT         equ           40037
;IDC_U2_RESTART       equ           40039
;IDC_U2_ATTACK        equ           40040
;IDC_U2_DOWN          equ           40041
;IDC_U1_ATTACK        equ           40042
;IDC_U1_ATTACK2       equ           40043

IDC_U1_UP            equ           'W'
IDC_U1_DOWN          equ           'S'
IDC_U1_LEFT          equ           'A'
IDC_U1_RIGHT         equ           'D'

IDC_U1_RESTART       equ           40013
IDC_U1_ATTACK        equ           40014

IDC_U2_UP            equ           VK_UP
IDC_U2_DOWN          equ           VK_DOWN
IDC_U2_LEFT          equ           VK_LEFT
IDC_U2_RIGHT         equ           VK_RIGHT

IDC_U2_RESTART       equ           40015
IDC_U2_ATTACK        equ           40016


; 关卡名
cLevel1			db		"1", 0
cLevel2			db		"2", 0
cLevel3			db		"3", 0
cLevel4			db		"4", 0
cLevel5			db		"5", 0
cLevel6			db		"6", 0
cLevel7			db		"7", 0
cLevel8			db		"8", 0
cLevel9			db		"9", 0
cLevel10		db		"10",0

Score1 dword 0
Score2 dword 0

MAX_LEN		EQU	SY_GRID_NUM_X*SY_GRID_NUM_Y
REC_LEN		EQU	SY_GRID_NUM_X*SY_GRID_NUM_Y
BRUSH_LEN	EQU 6

DialogBack      EQU 001E1E1Eh
ProgressBack    equ 003643f4h
ProgressFront   equ 00b2e0ffh
MAP_EMPTY		equ 000000ffh

endif