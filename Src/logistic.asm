.386
.model flat, stdcall
option casemap : none

include canvas.inc
include boxing.inc
include data.inc 
include levels.inc
include moves.inc
include logistic.inc
include	music.inc
include attack.inc

.data
hInstance		dd ?					; 主程序句柄

currentLevel	dd		0				;记录当前关卡
CurrentMode		dd		0				;记录当前Mode

LevelNum		dd		5				; 用于选关


isWin			db		0				; 判断是否成功

cLevel			dd		5 dup(0)
cScore1			dd		5 dup(0)
cScore2			dd		5 dup(0)


UserPos_1_X		sword	0				; 记录人的位置
UserPos_1_Y		sword	0				; 记录人的位置
syPlayerFace_1	dword	0				; 玩家朝向
UserScore_1		sword	0

UserPos_2_X		sword	0				; 记录人的位置
UserPos_2_Y		sword	0				; 记录人的位置
syPlayerFace_2	dword	0				; 玩家朝向
UserScore_2		sword	0

UserBuff		byte	0				; 

OriginMapText	dd		MAX_LEN dup(0)	; 原始地图矩阵
CurrentMapText  dd      MAX_LEN dup(0)	; 当前地图矩阵

CurrentFrame	dd		0				;Global Frame Counter
CurrentTime		dd		0				;Global Time Counter

strZero byte "0", 0h

ProgramName		db		"Game", 0		; 程序名称
ClassName db "SimpleWinClass",0
AppName   db "Our Fourth Window",0

Mode1Name   db "SIMPLE",0
Mode2Name   db "LAST WIN",0
Mode3Name   db "LAST DIE",0



U1_L	dd 0
U1_R	dd 0
U1_U	dd 0
U1_D	dd 0
U2_L	dd 0
U2_R	dd 0
U2_U	dd 0
U2_D	dd 0

DEBUG_CNT dd 0

.code

handleKeyInput proto uMsg : UINT, wParam : WPARAM, lParam : LPARAM
onControl proto hwnd:DWORD, uMsg:DWORD, PMidEvent:DWORD, dwTime:DWORD
onDraw proto hwnd:DWORD, uMsg:DWORD, PMidEvent:DWORD, dwTime:DWORD
onSwitchMusic proto hwnd:DWORD, uMsg:DWORD, PMidEvent:DWORD, dwTime:DWORD

WinMain PROC hInst : dword, hPrevInst : dword, cmdLine : dword, cmdShow : dword
	local wc : WNDCLASSEX; 窗口类
	local msg : MSG; 消息
	local hWnd : HWND; 对话框句柄

	invoke RtlZeroMemory, addr wc, sizeof WNDCLASSEX  ;给wc 填充为0
		; 播放音乐
	


	mov wc.cbSize, sizeof WNDCLASSEX; 窗口类的大小
	mov wc.style, CS_HREDRAW or CS_VREDRAW; 窗口风格
	mov wc.lpfnWndProc, offset Calculate; 窗口消息处理函数地址
	mov wc.cbClsExtra, 0; 在窗口类结构体后的附加字节数，共享内存
	mov wc.cbWndExtra, DLGWINDOWEXTRA; 在窗口实例后的附加字节数

	push hInst
	pop wc.hInstance; 窗口所属程序句柄

	mov wc.hbrBackground, COLOR_WINDOW; 背景画刷句柄
	mov wc.lpszMenuName, NULL; 菜单名称指针
	mov wc.lpszClassName, offset ProgramName; 窗口类类名称
	; 加载图标句柄
	;invoke LoadIcon, hInst, IDI_ICON
	;mov wc.hIcon, eax
	;mov wc.hIconSm, 0; 窗口小图标句柄

	; 加载光标句柄
	invoke LoadCursor, NULL, IDC_ARROW
	mov wc.hCursor, eax


	invoke RegisterClassEx, addr wc; 注册窗口类
	; 加载对话框窗口
	invoke CreateDialogParam, hInst, IDD_DIALOG1, 0, offset Calculate, 0
	;invoke CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,
                    ;   WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,
                     ;   CW_USEDEFAULT,CW_USEDEFAULT,NULL,NULL,hInst,NULL
	mov hWnd, eax
	
	; 设置主窗体id
	invoke sySetMainWinId, eax

	invoke ShowWindow, hWnd, SW_SHOWNORMAL; 显示窗口
	invoke UpdateWindow, hWnd; 更新窗口

	; 画按钮，only below best level is available
	mov ebx, 0
	.while ebx < LevelNum
		invoke SendMessage, hBLEVEL[ebx * 4], BM_SETIMAGE, IMAGE_BITMAP, syBLEVELBitmaps[ebx * 4]
		inc ebx
	.endw

	invoke SendMessage, hProgress, PBM_SETBKCOLOR, 0, ProgressBack
	invoke SendMessage, hProgress, PBM_SETBARCOLOR, 0, ProgressFront
	invoke SendMessage, hProgress, PBM_SETRANGE32, 0, TIMER_GAME
	
	
	; 消息循环
	.while TRUE
		invoke GetMessage, addr msg, NULL, 0, 0; 获取消息
		.break .if (eax == 0)
		invoke TranslateAccelerator, hWnd, hAcce, addr msg; 转换快捷键消息
		.if eax == 0
			invoke TranslateMessage, addr msg; 转换键盘消息
			invoke DispatchMessage, addr msg; 分发消息
			.if (msg.message == WM_KEYDOWN || msg.message == WM_KEYUP)
				invoke handleKeyInput, msg.message, msg.wParam, msg.lParam
			.endif
		.endif
	.endw

	mov eax, msg.wParam
	ret
WinMain endp

CreateLevelMap proc
	; 创建当前关卡地图
	
	.if currentLevel == 0
		invoke CreateMap1
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel1
	.elseif currentLevel == 1
		invoke CreateMap2
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel2
	.elseif currentLevel == 2
		invoke CreateMap3
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel3
	.elseif currentLevel == 3
		invoke CreateMap4
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel4
	.elseif currentLevel == 4
		invoke CreateMap5
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel5
	.elseif currentLevel == 5
		invoke CreateMap6
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel6
	.elseif currentLevel == 6
		invoke CreateMap7
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel7
	.elseif currentLevel == 7
		invoke CreateMap8
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel8
	.elseif currentLevel == 8
		invoke CreateMap9
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel9
	.elseif currentLevel == 9
		invoke CreateMap10
		invoke SendMessage, hLevelText, WM_SETTEXT, 0, offset cLevel10
	; .else
	; 	; 通关了
	; 	invoke syEndGame
	; 	jmp UPDATE_MAP
	.endif

	invoke syStartGame
; UPDATE_MAP:
	; 恢复步数为0，恢复获胜标志
	and UserScore_1, 0
	and UserScore_2, 0
	and isWin, 0
	and CurrentTime, 0
	
	invoke SendMessage, hProgress, PBM_SETPOS, 0, 0
	invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset strZero
	invoke SendMessage, hScoreText2, WM_SETTEXT, 0, offset strZero
	invoke syUpdateMap

	ret
CreateLevelMap endp

JudgeWin proc
	mov ax, UserScore_1
	.if ax >= UserScore_2
		invoke syEndGame, 0
	.else
		invoke syEndGame, 1
	.endif
	ret
JudgeWin endp

handleKeyInput proc uMsg : UINT, wParam : WPARAM, lParam : LPARAM
	.if uMsg == WM_KEYDOWN
		mov eax, wParam
		movzx eax, ax; 获得命令

		mov ebx, IDC_U2_RIGHT
		
		.if eax == IDC_U1_UP
			mov U1_U, 1h
		.elseif eax == IDC_U1_DOWN
			mov U1_D, 1h
		.elseif eax == IDC_U1_LEFT
			mov U1_L, 1h
		.elseif eax == IDC_U1_RIGHT
			mov U1_R, 1h
		.elseif eax == IDC_U2_UP
			mov U2_U, 1h
		.elseif eax == IDC_U2_DOWN
			mov U2_D, 1h
		.elseif eax == IDC_U2_LEFT
			mov U2_L, 1h
		.elseif eax == IDC_U2_RIGHT
			mov U2_R, 1h
		.endif

	.elseif uMsg == WM_KEYUP
		mov eax, wParam
		movzx eax, ax; 获得命令

		.if eax == IDC_U1_UP
			mov U1_U, 0h
		.elseif eax == IDC_U1_DOWN
			mov U1_D, 0h
		.elseif eax == IDC_U1_LEFT
			mov U1_L, 0h
		.elseif eax == IDC_U1_RIGHT
			mov U1_R, 0h
		.elseif eax == IDC_U2_UP
			mov U2_U, 0h
		.elseif eax == IDC_U2_DOWN
			mov U2_D, 0h
		.elseif eax == IDC_U2_LEFT
			mov U2_L, 0h
		.elseif eax == IDC_U2_RIGHT
			mov U2_R, 0h
		.endif

	.endif
	;mov ebx, 0
	;add ebx, U1_L
	;add ebx, U1_R
	;add ebx, U1_U
	;add ebx, U1_D
	;add ebx, U2_L
	;add ebx, U2_R
	;add ebx, U2_U
	;add ebx, U2_D
	;
	;invoke dwtoa, ebx, offset cStep
	;invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset cStep
	ret
handleKeyInput endp


setSelectPageVisibility proc VISIBILITY :dword
	invoke ShowWindow, hModeGroup, VISIBILITY
	invoke ShowWindow, hMode1, VISIBILITY
	invoke ShowWindow, hMode2, VISIBILITY
	invoke ShowWindow, hMode3, VISIBILITY
	invoke ShowWindow, hInfo, VISIBILITY
	mov ebx, 0
	.while ebx < LevelNum
		invoke ShowWindow, hBLEVEL[ebx * 4], VISIBILITY
		inc ebx
	.endw
	ret
setSelectPageVisibility endp


Calculate proc hWnd : dword, uMsg : UINT, wParam : WPARAM, lParam : LPARAM
	local hdc : HDC
	local ps : PAINTSTRUCT

	.if uMsg == WM_INITDIALOG
		; 获取菜单的句柄并显示菜单
		; invoke LoadMenu, hInstance, IDR_MENU1
		; mov hMenu, eax
		; invoke SetMenu, hWnd, hMenu

		; 获取快捷键的句柄并显示菜单
		invoke LoadAccelerators, hInstance, IDR_ACCELERATOR2
		mov hAcce, eax

		; 初始化数组和矩阵
		invoke InitRec, hWnd
		invoke InitBrush

		invoke  SetTimer, hWnd, ID_TIMER_CONTROL, TIMER_CONTROL_ITVL, onControl
		invoke  SetTimer, hWnd, ID_TIMER_DRAW, TIMER_DRAW_ITVL, onDraw
		;invoke  SetTimer, hWnd, ID_TIMER_MUSIC, TIMER_SWITCH_ITVL, onSwitchMusic

		;Music
		invoke play_music


	;.elseif uMsg == WM_TIMER
		;invoke switch_next_song
	.elseif uMsg == WM_PAINT
		; 绘制对话框背景
		invoke BeginPaint, hWnd, addr ps
		mov hdc, eax
		.if syScene != SY_SCENE_LEVEL
			invoke FillRect, hdc, addr ps.rcPaint, hDialogBrush
		.endif
		; 绘制地图
		invoke syDrawMap, hdc

		invoke EndPaint, hWnd, addr ps
;	.elseif uMsg == WM_GETDLGCODE
;		mov eax, DLGC_WANTCHARS
;		ret
;	.elseif uMsg ==	WM_MOUSEACTIVATE
;		invoke SetFocus, hWnd
;	.elseif uMsg == WM_CHAR
;		mov eax, wParam
;		movzx eax, ax; 获得命令
;		invoke dwtoa, eax, offset cStep
;		invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset cStep

	.elseif uMsg == WM_COMMAND
 		mov eax, wParam
		movzx eax, ax; 获得命令
		
		; 开始新游戏，此时需要加载当前关卡对应的地图
		.if eax == IDC_NEW || eax == ID_NEW
			; 隐藏按钮
			invoke setSelectPageVisibility, SW_HIDE
			; 创建当前关卡地图
			invoke CreateLevelMap
		;重新进入选择关卡界面
		.elseif eax == IDC_U1_RESTART || eax == IDC_U2_RESTART|| eax == IDC_REMAKE
			mov currentLevel, 0
			mov isWin, 0
			; invoke syResetGame
			; set default mode 1
			invoke SendMessage, hMode1, BM_SETCHECK, BST_CHECKED, 0
			invoke SendMessage, hMode2, BM_SETCHECK, BST_UNCHECKED, 0
			invoke SendMessage, hMode3, BM_SETCHECK, BST_UNCHECKED, 0

			invoke SendMessage, hWnd, WM_COMMAND, IDC_MODE1, 0
			invoke setSelectPageVisibility, SW_SHOWNORMAL

			invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset strZero
			invoke SendMessage, hScoreText2, WM_SETTEXT, 0, offset strZero

			invoke sySelectLevel
		.elseif eax == IDC_U1_ATTACK
			call AttackUser1
			;mov cStep, "A"
			;invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset cStep
		.elseif eax == IDC_U2_ATTACK
			call AttackUser2
			;mov cStep, "B"
			;invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset cStep

			; Level Select
		.elseif eax == IDC_BLEVEL1
			; 先把按钮擦除，再跳转
			mov currentLevel, 0 ;设置当前关卡的数字
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL2
			mov currentLevel, 1
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL3
			mov currentLevel, 2
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL4
			mov currentLevel, 3
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL5
			mov currentLevel, 4
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL6
			mov currentLevel, 5
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL7
			mov currentLevel, 6
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL8
			mov currentLevel, 7
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL9
			mov currentLevel, 8
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_BLEVEL10
			mov currentLevel, 9
			invoke setSelectPageVisibility, SW_HIDE
			invoke CreateLevelMap
		.elseif eax == IDC_MODE1
			mov CurrentMode, 1
			invoke SendMessage, hModeText, WM_SETTEXT, 0, offset Mode1Name
		.elseif eax == IDC_MODE2
			mov CurrentMode, 2
			invoke SendMessage, hModeText, WM_SETTEXT, 0, offset Mode2Name

			xor edx, edx
			mov eax, CurrentFrame
			mov ebx, 2
			div ebx
			mov UserBuff, dl
			
		.elseif eax == IDC_MODE3
			mov CurrentMode, 3
			invoke SendMessage, hModeText, WM_SETTEXT, 0, offset Mode3Name

			xor edx, edx
			mov eax, CurrentFrame
			mov ebx, 2
			div ebx
			mov UserBuff, dl
		.endif


		; ; 获胜处理
		; .if isWin == 1
		; 	invoke CreateLevelMap
		; .endif

	.elseif uMsg == WM_ERASEBKGND
		ret
	.elseif uMsg == WM_CLOSE
		invoke DestroyWindow, hWnd
	.elseif uMsg == WM_DESTROY
		invoke PostQuitMessage, 0
	.else
	invoke DefWindowProc, hWnd, uMsg, wParam, lParam
	ret

	.endif

	xor eax, eax

	ret
Calculate endp


onControl proc hwnd:DWORD, uMsg:DWORD, PMidEvent:DWORD, dwTime:DWORD
;	add DEBUG_CNT, 1
;	invoke dwtoa, DEBUG_CNT, offset cStep
;	invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset cStep
	.if (U1_L&&!U1_R)
		invoke MoveLeft,0
	.elseif (!U1_L&&U1_R)
		invoke MoveRight,0
	.endif

	.if (U1_U&&!U1_D)
		invoke MoveUp,0
	.elseif (!U1_U&&U1_D)
		invoke MoveDown,0
	.endif

	.if (U2_L&&!U2_R)
		invoke MoveLeft,1
	.elseif (!U2_L&&U2_R)
		invoke MoveRight,1
	.endif

	.if (U2_U&&!U2_D)
		invoke MoveUp,1
	.elseif (!U2_U&&U2_D)
		invoke MoveDown,1
	.endif
	ret
onControl endp

onDraw proc hwnd:DWORD, uMsg:DWORD, PMidEvent:DWORD, dwTime:DWORD
	;add DEBUG_CNT, 1
	;invoke dwtoa, CurrentFrame, offset cStep
	;invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset cStep
	.if syScene == SY_SCENE_LEVEL
		inc	CurrentFrame
		invoke syUpdateMap
		invoke releaseBuff ,CurrentFrame
		invoke dwtoa, UserScore_1, offset cScore1
		invoke SendMessage, hScoreText1, WM_SETTEXT, 0, offset cScore1
		invoke dwtoa, UserScore_2, offset cScore2
		invoke SendMessage, hScoreText2, WM_SETTEXT, 0, offset cScore2

		inc CurrentTime
		invoke SendMessage, hProgress, PBM_DELTAPOS, 1, 0

		.if CurrentTime == TIMER_GAME
			mov syScene, SY_SCENE_LEVEL
			call JudgeWin
		.endif
	.endif
	ret
onDraw endp

; onSwitchMusic proc hwnd:DWORD, uMsg:DWORD, PMidEvent:DWORD, dwTime:DWORD
; 	invoke	switch_next_song
; 	ret	
; onSwitchMusic endp

end
