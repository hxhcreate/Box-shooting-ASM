ifndef CANVAS_UTILS_INC
CANVAS_UTILS_INC equ <1>

include windows.inc
include user32.inc
include kernel32.inc
include comctl32.inc
include masm32.inc
include shell32.inc
include gdi32.inc
include msvcrt.inc
include msimg32.inc

includelib user32.lib
includelib kernel32.lib
includelib comctl32.lib
includelib masm32.lib
includelib gdi32.lib
includelib msvcrt.lib
includelib msimg32.lib
;
;include canvas.inc
.data

; Coinfigure

; 位图文件名
; sySplashFileName byte "./Assets/splash.bmp", 0h
; syPlayer1UpFileName byte "./Assets/player1_up.bmp", 0h
; syPlayer1RightFileName byte "./Assets/player1_right.bmp", 0h
; syPlayer1DownFileName byte "./Assets/player1_down.bmp", 0h
; syPlayer1LeftFileName byte "./Assets/player1_left.bmp", 0h
; syPlayer1InjureFileName byte "./Assets/player1_hit.bmp", 0h

; syPlayer2UpFileName byte "./Assets/player2_up.bmp", 0h
; syPlayer2RightFileName byte "./Assets/player2_right.bmp", 0h
; syPlayer2DownFileName byte "./Assets/player2_down.bmp", 0h
; syPlayer2LeftFileName byte "./Assets/player2_left.bmp", 0h
; syPlayer2InjureFileName byte "./Assets/player2_hit.bmp", 0h

; syTreasureFileName byte "./Assets/treasure.bmp", 0h
; syBombFileName byte "./Assets/bomb.bmp", 0h
; syAward1FileName byte "./Assets/win_p1.bmp", 0h
; syAward2FileName byte "./Assets/win_p2.bmp", 0h

; syEmptyFileName byte "./Assets/empty.bmp", 0h
; syWallFileName byte "./Assets/wall2.bmp", 0h
; syPathFileName byte "./Assets/path.bmp", 0h
; syBoxFileName byte "./Assets/box.bmp", 0h
; syBoxBrokenFileName byte "./Assets/box_broken.bmp", 0h
; syFenceFileName byte "./Assets/fence.bmp", 0h
; syWaterFileName byte "./Assets/water.bmp", 0h
; syBridgeFileName byte "./Assets/bridge.bmp", 0h
; syTreeFileName byte "./Assets/tree.bmp", 0h

; levelFileName1 byte "./Assets/level-1.bmp", 0h
; levelFileName2 byte "./Assets/level-2.bmp", 0h
; levelFileName3 byte "./Assets/level-3.bmp", 0h
; levelFileName4 byte "./Assets/level-4.bmp", 0h
; levelFileName5 byte "./Assets/level-5.bmp", 0h
; levelFileName6 byte "./Assets/level-6.bmp", 0h
; levelFileName7 byte "./Assets/level-7.bmp", 0h
; levelFileName8 byte "./Assets/level-8.bmp", 0h
; levelFileName9 byte "./Assets/level-9.bmp", 0h
; levelFileName10 byte "./Assets/level-10.bmp", 0h

syBombFileName               sword    IDB_BITMAP_BOMB              
syBoxFileName                sword    IDB_BITMAP_BOX               
syBoxBrokenFileName          sword    IDB_BITMAP_BOX_BROKEN        
syBridgeFileName             sword    IDB_BITMAP_BRIDGE            
syEmptyFileName              sword    IDB_BITMAP_EMPTY             
syFenceFileName              sword    IDB_BITMAP_FENCE             
levelFileName1               sword    IDB_BITMAP_LEVEL_1           
levelFileName2               sword    IDB_BITMAP_LEVEL_2           
levelFileName3               sword    IDB_BITMAP_LEVEL_3           
levelFileName4               sword    IDB_BITMAP_LEVEL_4           
levelFileName5               sword    IDB_BITMAP_LEVEL_5           
levelFileName6               sword    IDB_BITMAP_LEVEL_6           
levelFileName7               sword    IDB_BITMAP_LEVEL_7           
levelFileName8               sword    IDB_BITMAP_LEVEL_8           
levelFileName9               sword    IDB_BITMAP_LEVEL_9           
levelFileName10              sword    IDB_BITMAP_LEVEL_10          
syPathFileName               sword    IDB_BITMAP_PATH              
syPlayer1DownFileName        sword    IDB_BITMAP_PLAYER1_DOWN      
syPlayer1InjureFileName      sword    IDB_BITMAP_PLAYER1_HIT       
syPlayer1LeftFileName        sword    IDB_BITMAP_PLAYER1_LEFT      
syPlayer1RightFileName       sword    IDB_BITMAP_PLAYER1_RIGHT     
syPlayer1UpFileName          sword    IDB_BITMAP_PLAYER1_UP        
syPlayer2DownFileName        sword    IDB_BITMAP_PLAYER2_DOWN      
syPlayer2InjureFileName      sword    IDB_BITMAP_PLAYER2_HIT       
syPlayer2LeftFileName        sword    IDB_BITMAP_PLAYER2_LEFT      
syPlayer2RightFileName       sword    IDB_BITMAP_PLAYER2_RIGHT     
syPlayer2UpFileName          sword    IDB_BITMAP_PLAYER2_UP        
sySplashFileName             sword    IDB_BITMAP_SPLASH            
syTreasureFileName           sword    IDB_BITMAP_TREASURE          
syTreeFileName               sword    IDB_BITMAP_TREE              
syWallFileName               sword    IDB_BITMAP_WALL              
syWaterFileName              sword    IDB_BITMAP_WATER             
syAward1FileName             sword    IDB_BITMAP_AWARD1            
syAward2FileName             sword    IDB_BITMAP_AWARD2            


; Constants
; 地图区域x
SY_MAPX equ 45
; 地图区域y
SY_MAPY equ 90
; 格子尺寸
SY_GRID_SIZE equ 32
; 地图尺寸
SY_GRID_NUM_X equ 30
SY_GRID_NUM_Y equ 18

SY_MAP_SIZE_X equ SY_GRID_SIZE*SY_GRID_NUM_X
SY_MAP_SIZE_Y equ SY_GRID_SIZE*SY_GRID_NUM_Y

; 地图类型
; 无
SY_GRID_TYPE_NOTHING equ 0
; 不能移动的墙
SY_GRID_TYPE_WALL equ 1
; 可以移动的空地
SY_GRID_TYPE_PATH equ 2
; 箱子Perfect
SY_GRID_TYPE_BOX equ 3
; 箱子BROKEN
SY_GRID_TYPE_BOX_BROKEN equ 4

SY_GRID_TYPE_FENCE equ 5

SY_GRID_TYPE_WATER equ 6

SY_GRID_TYPE_BRIDGE equ 7

SY_GRID_TYPE_TREE_1 equ 8

SY_GRID_TYPE_TREE_2 equ 9


; 标题场景
SY_SCENE_TITLE equ 0
; 选择关卡场景
SY_SCENE_SELECT_LEVEL equ 1
; 关卡场景
SY_SCENE_LEVEL equ 2
; 通关场景
SY_SCENE_AWARD1 equ 3
SY_SCENE_AWARD2  equ 4

; FACE_DIRECTION
SY_FACE_UP equ 0
SY_FACE_RIGHT equ 1
SY_FACE_DOWN equ 2
SY_FACE_LEFT equ 3
SY_FACE_INJURE equ 4



externdef sySplashBitmap : HBITMAP

externdef syPlayer1UpBitmap : HBITMAP
externdef syPlayer1RightBitmap : HBITMAP
externdef syPlayer1DownBitmap : HBITMAP
externdef syPlayer1LeftBitmap : HBITMAP
externdef syPlayer1InjureBitmap : HBITMAP
externdef syPlayer2UpBitmap : HBITMAP
externdef syPlayer2RightBitmap : HBITMAP
externdef syPlayer2DownBitmap : HBITMAP
externdef syPlayer2LeftBitmap : HBITMAP
externdef syPlayer2InjureBitmap : HBITMAP

externdef syBombBitmap : HBITMAP
externdef syTreasureBitmap : HBITMAP
externdef syAward1Bitmap : HBITMAP
externdef syAward2Bitmap : HBITMAP

externdef syEmptyBitmap : HBITMAP
externdef syWallBitmap : HBITMAP
externdef syPathBitmap : HBITMAP
externdef syBoxBitmap : HBITMAP
externdef syBoxBrokenBitmap : HBITMAP
externdef syFenceBitmap : HBITMAP
externdef syWaterBitmap : HBITMAP
externdef syBridgeBitmap : HBITMAP
externdef syTreeBitmap : HBITMAP

externdef syMainWinDC : HDC

externdef syBLEVELBitmaps :HBITMAP
externdef hGuide		:	DWORD
externdef hLevel		:	DWORD
externdef hLevelText    :  DWORD
externdef hMenu			:DWORD
externdef hIcon			:DWORD
externdef hAcce			:DWORD
externdef hDialogBrush  :  DWORD
externdef hBLEVEL1		:DWORD
externdef hBLEVEL2		:DWORD
externdef hBLEVEL3		:DWORD
externdef hBLEVEL4		:DWORD
externdef hBLEVEL5		:DWORD
externdef hBLEVEL6		:DWORD
externdef hBLEVEL7		:DWORD
externdef hBLEVEL8		:DWORD
externdef hBLEVEL9		:DWORD
externdef hBLEVEL10		:DWORD
externdef hBLEVEL		:DWORD
externdef hInfo		:DWORD

externdef hModeText		:DWORD
externdef hModeGroup	:DWORD
externdef hMode1		:DWORD
externdef hMode2		:DWORD
externdef hMode3		:DWORD

externdef hScore1	    :DWORD
externdef hScoreText1	:DWORD
externdef hScore2	    :DWORD
externdef hScoreText2	:DWORD
externdef hProgress		:DWORD


.code
; 设置主窗体id
; win: HWND 窗体id
sySetMainWinId proto win: HWND

InitRec             PROTO :DWORD							; 初始化方格矩阵
InitBrush           PROTO       							; 初始化笔刷数组

; 加载位图
syLoadImage proto
; 绘制位图
; bitmap: HBITMAP 位图id
; i32X: sword 绘制位置x
; i32Y: sword 绘制位置y
; u32Width: dword 绘制宽度
; u32Height: dword 绘制高度
syDrawImage proto bitmap: HBITMAP, i32X: sword, i32Y: sword, u32Width: dword, u32Height: dword
syDrawImageAlpha proto bitmap: HBITMAP, i32X: sword, i32Y: sword, u32Width: dword, u32Height: dword

; 开始绘制
syBeginDraw proto
; 结束绘制
syEndDraw proto


endif