.386
.model flat, stdcall
option casemap : none

include canvas.inc
include boxing.inc
include data.inc 
include levels.inc
include moves.inc
include logistic.inc
include canvas-utils.inc

.data
MOVE_SPEED_HORIZONTAL equ 5
MOVE_SPEED_VERTICAL equ 5
VALID_DISTANCE equ 5

.code


MapFromPixelsToPointIndex proc xx: dword, yy: dword
	mov edx, 0
	mov eax, xx
	mov ecx, SY_GRID_SIZE
	div ecx 
	mov esi, eax  ; 商 即为 x轴的index
	mov edx, 0
	mov eax, yy
	mov ecx, SY_GRID_SIZE
	div ecx
	mov edi, eax;  商 即为 y轴的index

	mov eax, SY_GRID_NUM_X
	mul edi
	add eax, esi
	ret
MapFromPixelsToPointIndex endp


MoveUp proc Player:byte
	local tmpx : dword
	local tmpy : dword
	.if (Player==0)
		.if syPlayerFace_1 == SY_FACE_INJURE
			ret
		.endif
	.else
		.if syPlayerFace_2 == SY_FACE_INJURE
			ret
		.endif
	.endif

	.if Player==0
		movzx edi, UserPos_1_X
		mov tmpx, edi
		movzx edi, UserPos_1_Y
		mov tmpy, edi
	.else
		movzx edi, UserPos_2_X
		mov tmpx, edi
		movzx edi, UserPos_2_Y
		mov tmpy, edi
	.endif

	invoke sySetPlayerFace, Player, SY_FACE_UP

	sub tmpy, SY_GRID_SIZE / 2
	invoke MapFromPixelsToPointIndex, tmpx, tmpy 
	.if CurrentMapText[eax * 4] == SY_GRID_TYPE_PATH || CurrentMapText[eax * 4] == SY_GRID_TYPE_NOTHING || CurrentMapText[eax * 4] == SY_GRID_TYPE_BRIDGE
		.if (Player==0)
			sub UserPos_1_Y, MOVE_SPEED_VERTICAL
		.else
			sub UserPos_2_Y, MOVE_SPEED_VERTICAL
		.endif
	.endif
	ret
MoveUp endp

MoveDown proc Player:byte
	local tmpx : dword
	local tmpy : dword
	.if (Player==0)
		.if syPlayerFace_1 == SY_FACE_INJURE
			ret
		.endif
	.else
		.if syPlayerFace_2 == SY_FACE_INJURE
			ret
		.endif
	.endif
	.if Player==0
		movzx edi, UserPos_1_X
		mov tmpx, edi
		movzx edi, UserPos_1_Y
		mov tmpy, edi
	.else
		movzx edi, UserPos_2_X
		mov tmpx, edi
		movzx edi, UserPos_2_Y
		mov tmpy, edi
	.endif

	invoke sySetPlayerFace, Player, SY_FACE_DOWN
	add tmpy, SY_GRID_SIZE / 2
	invoke MapFromPixelsToPointIndex, tmpx, tmpy 
	.if CurrentMapText[eax * 4] == SY_GRID_TYPE_PATH || CurrentMapText[eax * 4] == SY_GRID_TYPE_NOTHING || CurrentMapText[eax * 4] == SY_GRID_TYPE_BRIDGE
		.if (Player==0)
			add UserPos_1_Y, MOVE_SPEED_VERTICAL
		.else
			add UserPos_2_Y, MOVE_SPEED_VERTICAL
		.endif
	.endif
	ret
MoveDown endp

MoveLeft proc Player:byte
	local tmpx: dword
	local tmpy: dword
	.if (Player==0)
		.if syPlayerFace_1 == SY_FACE_INJURE
			ret
		.endif
	.else
		.if syPlayerFace_2 == SY_FACE_INJURE
			ret
		.endif
	.endif

	.if Player==0
		movzx edi, UserPos_1_X
		mov tmpx, edi
		movzx edi, UserPos_1_Y
		mov tmpy, edi
	.else
		movzx edi, UserPos_2_X
		mov tmpx, edi
		movzx edi, UserPos_2_Y
		mov tmpy, edi
	.endif

	invoke sySetPlayerFace, Player, SY_FACE_LEFT
	sub tmpx, SY_GRID_SIZE / 2
	invoke MapFromPixelsToPointIndex, tmpx, tmpy 
	.if CurrentMapText[eax * 4] == SY_GRID_TYPE_PATH || CurrentMapText[eax * 4] == SY_GRID_TYPE_NOTHING || CurrentMapText[eax * 4] == SY_GRID_TYPE_BRIDGE
		.if (Player==0)
			sub UserPos_1_X, MOVE_SPEED_HORIZONTAL
		.else
			sub UserPos_2_X, MOVE_SPEED_HORIZONTAL
		.endif
	.endif

	
	ret
MoveLeft endp

MoveRight proc Player:byte
	local tmpx: dword
	local tmpy: dword
	.if (Player==0)
		.if syPlayerFace_1 == SY_FACE_INJURE
			ret
		.endif
	.else
		.if syPlayerFace_2 == SY_FACE_INJURE
			ret
		.endif
	.endif

	.if Player==0
		movzx edi, UserPos_1_X
		mov tmpx, edi
		movzx edi, UserPos_1_Y
		mov tmpy, edi
	.else
		movzx edi, UserPos_2_X
		mov tmpx, edi
		movzx edi, UserPos_2_Y
		mov tmpy, edi
	.endif

	invoke sySetPlayerFace, Player, SY_FACE_RIGHT
	add tmpx, SY_GRID_SIZE / 2
	invoke MapFromPixelsToPointIndex, tmpx, tmpy 
	.if CurrentMapText[eax * 4] == SY_GRID_TYPE_PATH || CurrentMapText[eax * 4] == SY_GRID_TYPE_NOTHING || CurrentMapText[eax * 4] == SY_GRID_TYPE_BRIDGE
		.if (Player==0)
			add UserPos_1_X, MOVE_SPEED_HORIZONTAL
		.else
			add UserPos_2_X, MOVE_SPEED_HORIZONTAL
		.endif
	.endif
	ret
MoveRight endp


end
