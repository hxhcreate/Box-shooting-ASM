.386
.model flat, stdcall
option casemap: none

include canvas.inc
include canvas-utils.inc

.data
syBLEVELBitmaps HBITMAP 10 dup(0)

hGuide			dd ?					; 引导文字句柄

hLevel			dd ?					; 关卡句柄
hLevelText      dd ?					; 关卡文本句柄
hMenu			dd ?					; 菜单句柄
hIcon			dd ?					; 图标句柄
hAcce			dd ?					; 热键句柄
hDialogBrush    dd ?					; 对话框背景笔刷

hBLEVEL1		dd	?	;选关按钮句柄
hBLEVEL2		dd	?
hBLEVEL3		dd	?
hBLEVEL4		dd	?
hBLEVEL5		dd	?
hBLEVEL6		dd	?
hBLEVEL7		dd	?
hBLEVEL8		dd	?
hBLEVEL9		dd	?
hBLEVEL10		dd	?

hBLEVEL			dd	10	dup(0)
hInfo			dd	?

hModeText		dd  ?					
hModeGroup		dd	?
hMode1			dd	?
hMode2			dd	?
hMode3			dd	?

hScore1			dd  ?					
hScoreText1		dd  ?					
hScore2			dd  ?		
hScoreText2		dd  ?	
hProgress		dd  ?	

; 位图
sySplashBitmap HBITMAP ?

syPlayer1UpBitmap HBITMAP ?
syPlayer1RightBitmap HBITMAP ?
syPlayer1DownBitmap HBITMAP ?
syPlayer1LeftBitmap HBITMAP ?
syPlayer1InjureBitmap HBITMAP ?
syPlayer2UpBitmap HBITMAP ?
syPlayer2RightBitmap HBITMAP ?
syPlayer2DownBitmap HBITMAP ?
syPlayer2LeftBitmap HBITMAP ?
syPlayer2InjureBitmap HBITMAP ?

syBombBitmap HBITMAP ?
syTreasureBitmap HBITMAP ?
syAward1Bitmap HBITMAP ?
syAward2Bitmap HBITMAP ?

syEmptyBitmap HBITMAP ?
syWallBitmap HBITMAP ?
syPathBitmap HBITMAP ?
syBoxBitmap HBITMAP ?
syBoxBrokenBitmap HBITMAP ?
syFenceBitmap HBITMAP ?
syWaterBitmap HBITMAP ?
syBridgeBitmap HBITMAP ?
syTreeBitmap HBITMAP ?


; DC
; I hate GDI
syMainWinDC HDC ?
syMainBitmapDC HDC ?
syMainBitmapDC2 HDC ?
syMainBitmap HDC ?

.code
sySetMainWinId proc win: HWND
	; 设置主窗体id，省得传来传去
	mov eax, win
	mov syMainWinId, eax

	ret
sySetMainWinId endp

InitRec proc hWnd : dword
	; 调用GetDlgItem函数获得句柄
	; 包括整体背景的句柄等

	invoke GetDlgItem, hWnd, IDC_LEVEL
	mov hLevel, eax

	invoke GetDlgItem, hWnd, IDC_LEVELTEXT
	mov hLevelText, eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL1
	mov hBLEVEL1, eax
	mov hBLEVEL[0], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL2
	mov hBLEVEL2, eax
	mov hBLEVEL[4], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL3
	mov hBLEVEL3, eax
	mov hBLEVEL[8], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL4
	mov hBLEVEL4, eax
	mov hBLEVEL[12], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL5
	mov hBLEVEL5, eax
	mov hBLEVEL[16], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL6
	mov hBLEVEL6, eax
	mov hBLEVEL[20], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL7
	mov hBLEVEL7, eax
	mov hBLEVEL[24], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL8
	mov hBLEVEL8, eax
	mov hBLEVEL[28], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL9
	mov hBLEVEL9, eax
	mov hBLEVEL[32], eax

	invoke GetDlgItem, hWnd, IDC_BLEVEL10
	mov hBLEVEL10, eax
	mov hBLEVEL[36], eax

	invoke GetDlgItem, hWnd, IDC_Modes
	mov hModeGroup, eax

	invoke GetDlgItem, hWnd, IDC_MODE1
	mov hMode1, eax

	invoke GetDlgItem, hWnd, IDC_MODE2
	mov hMode2, eax

	invoke GetDlgItem, hWnd, IDC_MODE3
	mov hMode3, eax

	invoke GetDlgItem, hWnd, IDC_MODETEXT
	mov hModeText, eax

	invoke GetDlgItem, hWnd, IDC_SCORE1
	mov hScore1, eax

	invoke GetDlgItem, hWnd, IDC_SCORETEXT1
	mov hScoreText1, eax

	invoke GetDlgItem, hWnd, IDC_SCORE2
	mov hScore2, eax

	invoke GetDlgItem, hWnd, IDC_SCORETEXT2
	mov hScoreText2, eax

	invoke GetDlgItem, hWnd, IDC_INFO
	mov hInfo, eax

	invoke GetDlgItem, hWnd, IDC_PROGRESS
	mov hProgress, eax

	ret
	InitRec endp

InitBrush proc
	; 创建不同种类的画刷颜色
	invoke CreateSolidBrush, DialogBack
	mov hDialogBrush, eax

	; 加载选关按钮对应的位图文件
	invoke LoadImage, hInstance, levelFileName1, IMAGE_BITMAP, 100, 80, LR_DEFAULTCOLOR
	mov syBLEVELBitmaps[0], eax
	invoke LoadImage, hInstance, levelFileName2, IMAGE_BITMAP, 100, 80, LR_DEFAULTCOLOR
	mov syBLEVELBitmaps[4], eax
	invoke LoadImage, hInstance, levelFileName3, IMAGE_BITMAP, 100, 80, LR_DEFAULTCOLOR
	mov syBLEVELBitmaps[8], eax
	invoke LoadImage, hInstance, levelFileName4, IMAGE_BITMAP, 100, 80, LR_DEFAULTCOLOR
	mov syBLEVELBitmaps[12], eax
	invoke LoadImage, hInstance, levelFileName5, IMAGE_BITMAP, 100, 80, LR_DEFAULTCOLOR
	mov syBLEVELBitmaps[16], eax
	; invoke LoadImage, hInstance, levelFileName6, IMAGE_BITMAP, 30, 40, LR_DEFAULTCOLOR
	; mov syBLEVELBitmaps[20], eax
	; invoke LoadImage, hInstance, levelFileName7, IMAGE_BITMAP, 30, 40, LR_DEFAULTCOLOR
	; mov syBLEVELBitmaps[24], eax
	; invoke LoadImage, hInstance, levelFileName8, IMAGE_BITMAP, 30, 40, LR_DEFAULTCOLOR
	; mov syBLEVELBitmaps[28], eax
	; invoke LoadImage, hInstance, levelFileName9, IMAGE_BITMAP, 30, 40, LR_DEFAULTCOLOR
	; mov syBLEVELBitmaps[32], eax
	; invoke LoadImage, hInstance, levelFileName10, IMAGE_BITMAP, 60, 40, LR_DEFAULTCOLOR
	; mov syBLEVELBitmaps[36], eax
	ret
InitBrush endp


syLoadImage proc
	; 加载位图

	.if syScene == SY_SCENE_TITLE
		; 主界面场景
		; 加载主界面位图

		invoke LoadImage, hInstance, sySplashFileName, IMAGE_BITMAP, SY_MAP_SIZE_X, SY_MAP_SIZE_Y, LR_DEFAULTCOLOR
		mov sySplashBitmap, eax
	.elseif syScene == SY_SCENE_LEVEL
		; 关卡场景
		; 加载格子位图

		invoke LoadImage, hInstance, syPlayer1UpFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer1UpBitmap, eax
		invoke LoadImage, hInstance, syPlayer1RightFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer1RightBitmap, eax
		invoke LoadImage, hInstance, syPlayer1DownFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer1DownBitmap, eax
		invoke LoadImage, hInstance, syPlayer1LeftFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer1LeftBitmap, eax
		invoke LoadImage, hInstance, syPlayer1InjureFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer1InjureBitmap, eax

		invoke LoadImage, hInstance, syPlayer2UpFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer2UpBitmap, eax
		invoke LoadImage, hInstance, syPlayer2RightFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer2RightBitmap, eax
		invoke LoadImage, hInstance, syPlayer2DownFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer2DownBitmap, eax
		invoke LoadImage, hInstance, syPlayer2LeftFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer2LeftBitmap, eax
		invoke LoadImage, hInstance, syPlayer2InjureFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPlayer2InjureBitmap, eax

		invoke LoadImage, hInstance, syBombFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syBombBitmap, eax
		invoke LoadImage, hInstance, syTreasureFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syTreasureBitmap, eax

		invoke LoadImage, hInstance, syEmptyFileName, IMAGE_BITMAP, SY_MAP_SIZE_X, SY_MAP_SIZE_Y, LR_DEFAULTCOLOR
		mov syEmptyBitmap, eax
		invoke LoadImage, hInstance, syWallFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syWallBitmap, eax
		invoke LoadImage, hInstance, syPathFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syPathBitmap, eax
		invoke LoadImage, hInstance, syBoxFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syBoxBitmap, eax
		invoke LoadImage, hInstance, syBoxBrokenFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syBoxBrokenBitmap, eax
		invoke LoadImage, hInstance, syFenceFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syFenceBitmap, eax
		invoke LoadImage, hInstance, syWaterFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syWaterBitmap, eax
		invoke LoadImage, hInstance, syBridgeFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE, LR_DEFAULTCOLOR
		mov syBridgeBitmap, eax
		invoke LoadImage, hInstance, syTreeFileName, IMAGE_BITMAP, SY_GRID_SIZE, SY_GRID_SIZE*2, LR_DEFAULTCOLOR
		mov syTreeBitmap, eax

	.elseif syScene == SY_SCENE_AWARD1
		; 通关场景
		invoke LoadImage, hInstance, syAward1FileName, IMAGE_BITMAP, SY_MAP_SIZE_X, SY_MAP_SIZE_Y, LR_DEFAULTCOLOR
		mov syAward1Bitmap, eax
	.elseif syScene == SY_SCENE_AWARD2
		invoke LoadImage, hInstance, syAward2FileName, IMAGE_BITMAP, SY_MAP_SIZE_X, SY_MAP_SIZE_Y, LR_DEFAULTCOLOR
		mov syAward2Bitmap, eax
	.endif

	ret
syLoadImage endp

syDrawImage proc bitmap: HBITMAP, i32X: sword, i32Y: sword, u32Width: dword, u32Height: dword
	; 输出位图数据
	invoke SelectObject, syMainBitmapDC2, bitmap
	invoke BitBlt, syMainBitmapDC, i32X, i32Y, u32Width, u32Height, syMainBitmapDC2, 0, 0, SRCCOPY
	ret
syDrawImage endp

syDrawImageAlpha proc bitmap: HBITMAP, i32X: sword, i32Y: sword, u32Width: dword, u32Height: dword
	; 输出位图数据
	invoke SelectObject, syMainBitmapDC2, bitmap
	invoke TransparentBlt, syMainBitmapDC, i32X, i32Y, u32Width, u32Height, syMainBitmapDC2, 0, 0, u32Width, u32Height, 16777215
	ret
syDrawImageAlpha endp

syBeginDraw proc
	;local rect: RECT
	;; [rect.left, rect.top, rect.right, rect.bottom] = [SY_MAPX, SY_MAPY, SY_MAPX + SY_MAP_SIZE_X, SY_MAPY + SY_MAP_SIZE_Y]
	;mov rect.left, SY_MAPX
	;mov rect.top, SY_MAPY
	;
	;mov eax, SY_MAP_SIZE_X
	;add eax, SY_MAPX
	;mov rect.right, eax
	;
	;mov eax, SY_MAP_SIZE_Y
	;add eax, SY_MAPY
	;MOV rect.bottom, eax


	; 创建DC
	invoke CreateCompatibleDC, syMainWinDC
	mov syMainBitmapDC, eax

	.if syScene != SY_SCENE_SELECT_LEVEL
		invoke CreateCompatibleDC, syMainWinDC
		mov syMainBitmapDC2, eax

		invoke CreateCompatibleBitmap, syMainWinDC, SY_MAP_SIZE_X, SY_MAP_SIZE_Y
		mov syMainBitmap, eax

		invoke SelectObject, syMainBitmapDC, syMainBitmap
		; invoke PatBlt, syMainBitmapDC, 0, 0, SY_MAP_SIZE_X, SY_MAP_SIZE_Y, WHITENESS
		invoke SelectObject, syMainBitmapDC, syEmptyBitmap
		invoke BitBlt, syMainBitmapDC, 0, 0, SY_MAP_SIZE_X, SY_MAP_SIZE_Y, syMainBitmapDC, 0, 0, SRCCOPY

	.endif

	ret
syBeginDraw endp

syEndDraw proc
	; 删除位图

	.if syScene == SY_SCENE_TITLE
		; 主界面场景
		; 删除主界面位图

		invoke DeleteObject, sySplashBitmap
	.elseif syScene == SY_SCENE_LEVEL
		; 关卡场景
		; 删除格子位图

		invoke DeleteObject, syPlayer1UpBitmap
		invoke DeleteObject, syPlayer1RightBitmap
		invoke DeleteObject, syPlayer1DownBitmap
		invoke DeleteObject, syPlayer1LeftBitmap
		invoke DeleteObject, syPlayer1InjureBitmap

		invoke DeleteObject, syPlayer2UpBitmap
		invoke DeleteObject, syPlayer2RightBitmap
		invoke DeleteObject, syPlayer2DownBitmap
		invoke DeleteObject, syPlayer2LeftBitmap
		invoke DeleteObject, syPlayer2InjureBitmap

		invoke DeleteObject, syBombBitmap
		invoke DeleteObject, syTreasureBitmap
		
		invoke DeleteObject, syEmptyBitmap
		invoke DeleteObject, syWallBitmap
		invoke DeleteObject, syPathBitmap
		invoke DeleteObject, syBoxBitmap
		invoke DeleteObject, syBoxBrokenBitmap
		invoke DeleteObject, syFenceBitmap
		invoke DeleteObject, syWaterBitmap
		invoke DeleteObject, syBridgeBitmap
		invoke DeleteObject, syTreeBitmap

	.elseif syScene == SY_SCENE_AWARD1
		invoke DeleteObject, syAward1Bitmap
	.elseif syScene == SY_SCENE_AWARD2
		invoke DeleteObject, syAward2Bitmap
	.endif

	.if syScene != SY_SCENE_SELECT_LEVEL
		invoke BitBlt, syMainWinDC, SY_MAPX, SY_MAPY, SY_MAP_SIZE_X, SY_MAP_SIZE_Y, syMainBitmapDC, 0, 0, SRCCOPY
	.endif
	; 删除DC
    invoke DeleteDC, syMainBitmapDC
    invoke DeleteDC, syMainBitmapDC2
    invoke DeleteObject, syMainBitmap

	ret
syEndDraw endp


end