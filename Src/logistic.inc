ifndef LOGISTIC_INC
LOGISTIC_INC equ <1>

.data

ID_TIMER_CONTROL	equ 1001
ID_TIMER_DRAW	equ 1002
ID_TIMER_MUSIC   equ 1003
;Timer Configuration
TIMER_CONTROL_ITVL	equ 16	;gap for control
TIMER_DRAW_ITVL	equ 33		;gap for display
TIMER_SWITCH_ITVL equ 1000

TIMER_GAME equ 30*20


.code

Calculate           PROTO :DWORD, :DWORD, :DWORD, :DWORD	; 消息处理程序

RefreshRec			PROTO
ShowNumber			PROTO
WinMain             PROTO :DWORD, :DWORD, :DWORD, :DWORD	; 窗口主程序


externdef CurrentMode: dword
externdef UserBuff: byte

externdef CurrentMapText: dword
externdef OriginMapText: dword

externdef UserPos_1_X: sword
externdef UserPos_1_Y: sword
externdef syPlayerFace_1: dword
externdef UserScore_1: sword

externdef UserPos_2_X: sword
externdef UserPos_2_Y: sword
externdef syPlayerFace_2: dword
externdef UserScore_2: sword


externdef hInstance: dword
externdef CurrentFrame	:dword				;Global Frame Counter
externdef CurrentMode	:dword		

externdef UserBuff		:byte



endif