.386
.model flat, stdcall
option casemap: none

include canvas.inc



.data
; 主窗体id
syMainWinId HWND ?
; 游戏场景
syScene byte 0



.code

syStartGame proc
	mov syScene, SY_SCENE_LEVEL

	ret
syStartGame endp

sySelectLevel proc
	mov syScene, SY_SCENE_SELECT_LEVEL
	invoke syUpdateMap

	ret
sySelectLevel endp

syEndGame proc Winner:byte

	.if Winner == 0
		mov syScene, SY_SCENE_AWARD1
	.else
		mov syScene, SY_SCENE_AWARD2
	.endif
	ret
syEndGame endp

syGetGridType proc u32Index: dword
	; 获取格子类型
	local oldebx: dword ; I hate Assembler

	mov oldebx, ebx
	mov ebx, u32Index

	mov eax, CurrentMapText[ebx * 4]

	;.if eax == SY_GRID_TYPE_PLAYER
	;	; 玩家
	;	mov eax, SY_GRID_TYPE_PLAYER_UP
	;	add eax, syPlayerFace
	;.else
	;.if eax == SY_GRID_TYPE_BOX
	;	; 箱子
	;	mov eax, OriginMapText[ebx * 4]
	;	.if eax == SY_GRID_TYPE_TARGET
	;		; 在目标点
	;		mov eax, SY_GRID_TYPE_BOX_BROKEN
	;	.else
	;		; 不在目标点
	;		mov eax, SY_GRID_TYPE_BOX
	;	.endif
	;.endif

	mov ebx, oldebx

	ret
syGetGridType endp

sySetPlayerFace proc Player:byte, u32Face: dword
	mov eax, u32Face
	
	.if (Player==0)
		.if(syPlayerFace_1 != SY_FACE_INJURE)
			mov syPlayerFace_1, eax
		.endif
	.else
		.if(syPlayerFace_2 != SY_FACE_INJURE)
			mov syPlayerFace_2, eax
		.endif
	.endif
	ret
sySetPlayerFace endp

syUpdateMap proc
	; 无效化地图区域
	local rect: RECT

	; [rect.left, rect.top, rect.right, rect.bottom] = [SY_MAPX, SY_MAPY, SY_MAPX + SY_MAP_SIZE_X, SY_MAPY + SY_MAP_SIZE_Y]
	mov rect.left, SY_MAPX
	mov rect.top, SY_MAPY

	mov eax, SY_MAP_SIZE_X
	add eax, SY_MAPX
	mov rect.right, eax

	mov eax, SY_MAP_SIZE_Y
	add eax, SY_MAPY
	MOV rect.bottom, eax

	invoke InvalidateRect, syMainWinId, addr rect, TRUE

	ret
syUpdateMap endp

syUpdateGrid proc u32GridInd: dword
	ret
;	; 无效化格子
;	local rect: RECT
;	local p: dword
;	
;	; p = u32GridInd / 10
;	; edx = u32GridInd % 10
;	mov eax, u32GridInd
;	mov ebx, 10
;	div ebx
;	mov p, eax
;
;	; rect.left = SY_MAPX + edx * SY_GRID_SIZE
;	mov eax, edx
;	mov ebx, SY_GRID_SIZE
;	mul ebx
;	add eax, SY_MAPX
;	mov rect.left, eax
;	; rect.right = rect.left + SY_GRID_SIZE
;	add eax, SY_GRID_SIZE
;	mov rect.right, eax
;
;	; rect.top = SY_MAPY + p * SY_GRID_SIZE
;	mov eax, p
;	mov ebx, SY_GRID_SIZE
;	mul ebx
;	add eax, SY_MAPY
;	mov rect.top, eax
;	; rect.bottom = rect.top + SY_GRID_SIZE
;	add eax, SY_GRID_SIZE
;	MOV rect.bottom, eax
;
;	invoke InvalidateRect, syMainWinId, addr rect, FALSE
;
	ret
syUpdateGrid endp

syDrawMap proc devc: HDC
	local tmpUser2Y: sword
	local tmpUser2X: sword
	local tmpUser1Y: sword
	local tmpUser1X: sword

	; 绘制地图
	local nextX: sword ; 循环中下一个x
	local nextY: sword ; 循环中下一个y
	local colInd: dword ; 循环中列号

	; 保存主窗体DC
	mov eax, devc
	mov syMainWinDC, eax
	invoke syLoadImage
	invoke syBeginDraw

	.if syScene == SY_SCENE_TITLE
		; 主界面场景
		; 绘制主界面

		invoke syDrawImage, sySplashBitmap, 0, 0, SY_MAP_SIZE_X, SY_MAP_SIZE_X
	.elseif syScene == SY_SCENE_LEVEL
		; 关卡场景
		; 绘制所有格子（可优化）

		; 循环绘制方格
		mov nextX, 0
		mov nextY, 0
		mov colInd, 0
		xor ebx, ebx
		.while ebx < REC_LEN
			invoke syGetGridType, ebx
			; 该画啥画啥
			.if eax == SY_GRID_TYPE_WALL
				invoke syDrawImage, syWallBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE
			.elseif eax == SY_GRID_TYPE_PATH
				invoke syDrawImage, syPathBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE
			.elseif eax == SY_GRID_TYPE_BOX
				invoke syDrawImage, syBoxBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE
			.elseif eax == SY_GRID_TYPE_BOX_BROKEN
				invoke syDrawImage, syBoxBrokenBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE
			.elseif eax == SY_GRID_TYPE_FENCE
				invoke syDrawImage, syFenceBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE
			.elseif eax == SY_GRID_TYPE_WATER
				invoke syDrawImage, syWaterBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE
			.elseif eax == SY_GRID_TYPE_BRIDGE
				invoke syDrawImage, syBridgeBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE
			.elseif eax == SY_GRID_TYPE_TREE_1
				invoke syDrawImage, syTreeBitmap, nextX, nextY, SY_GRID_SIZE, SY_GRID_SIZE*2
			.endif

			add nextX, SY_GRID_SIZE
			inc colInd
			.if colInd == SY_GRID_NUM_X
				; 列号到SY_GRID_NUM_X，开始下一行
				mov nextX, 0
				add nextY, SY_GRID_SIZE
				mov colInd, 0
			.endif

			inc ebx
		.endw

		;mov edx, 0
		;mov eax, CurrPosition
		;mov ebx, SY_GRID_NUM_X
		;div ebx
		;mov UserPos_X, ax
		;mov UserPos_Y, dx



		mov si, UserPos_1_X
		mov tmpUser1X, si
		sub tmpUser1X, SY_GRID_SIZE / 2 

		mov si, UserPos_1_Y
		mov tmpUser1Y, si
		sub tmpUser1Y, SY_GRID_SIZE / 2 

		mov si, UserPos_2_X
		mov tmpUser2X, si
		sub tmpUser2X, SY_GRID_SIZE / 2 

		mov si, UserPos_2_Y
		mov tmpUser2Y, si
		sub tmpUser2Y, SY_GRID_SIZE / 2 


		.if syPlayerFace_1 == SY_FACE_UP
			invoke syDrawImageAlpha, syPlayer1UpBitmap, tmpUser1X, tmpUser1Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_1 == SY_FACE_RIGHT
			invoke syDrawImageAlpha, syPlayer1RightBitmap, tmpUser1X, tmpUser1Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_1 == SY_FACE_DOWN
			invoke syDrawImageAlpha, syPlayer1DownBitmap, tmpUser1X, tmpUser1Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_1 == SY_FACE_LEFT
			invoke syDrawImageAlpha, syPlayer1LeftBitmap, tmpUser1X, tmpUser1Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_1 == SY_FACE_INJURE
			invoke syDrawImageAlpha, syPlayer1InjureBitmap, tmpUser1X, tmpUser1Y, SY_GRID_SIZE, SY_GRID_SIZE
		.endif

		.if syPlayerFace_2 == SY_FACE_UP
			invoke syDrawImageAlpha, syPlayer2UpBitmap, tmpUser2X, tmpUser2Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_2 == SY_FACE_RIGHT
			invoke syDrawImageAlpha, syPlayer2RightBitmap, tmpUser2X, tmpUser2Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_2 == SY_FACE_DOWN
			invoke syDrawImageAlpha, syPlayer2DownBitmap, tmpUser2X, tmpUser2Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_2 == SY_FACE_LEFT
			invoke syDrawImageAlpha, syPlayer2LeftBitmap, tmpUser2X, tmpUser2Y, SY_GRID_SIZE, SY_GRID_SIZE
		.elseif syPlayerFace_2 == SY_FACE_INJURE
			invoke syDrawImageAlpha, syPlayer2InjureBitmap, tmpUser2X, tmpUser2Y, SY_GRID_SIZE, SY_GRID_SIZE
		.endif


		.if CurrentMode == 2
			.if UserBuff == 0
				sub tmpUser1Y, SY_GRID_SIZE
				invoke syDrawImageAlpha, syTreasureBitmap, tmpUser1X, tmpUser1Y, SY_GRID_SIZE, SY_GRID_SIZE
			.else
				sub tmpUser2Y, SY_GRID_SIZE
				invoke syDrawImageAlpha, syTreasureBitmap, tmpUser2X, tmpUser2Y, SY_GRID_SIZE, SY_GRID_SIZE
			.endif
		.elseif CurrentMode == 3
			.if UserBuff == 1
				sub tmpUser1Y, SY_GRID_SIZE
				invoke syDrawImageAlpha, syBombBitmap, tmpUser1X, tmpUser1Y, SY_GRID_SIZE, SY_GRID_SIZE
			.else
				sub tmpUser2Y, SY_GRID_SIZE
				invoke syDrawImageAlpha, syBombBitmap, tmpUser2X, tmpUser2Y, SY_GRID_SIZE, SY_GRID_SIZE
			.endif
		.endif

	.elseif syScene == SY_SCENE_AWARD1
		; 通关场景
		; 绘制通关图

		invoke syDrawImage, syAward1Bitmap, 0, 0, SY_MAP_SIZE_X, SY_MAP_SIZE_X
	.elseif syScene == SY_SCENE_AWARD2
		; 通关场景
		; 绘制通关图

		invoke syDrawImage, syAward2Bitmap, 0, 0, SY_MAP_SIZE_X, SY_MAP_SIZE_X
	.endif
	
	invoke syEndDraw

	ret
syDrawMap endp


end
