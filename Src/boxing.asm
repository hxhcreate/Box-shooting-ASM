.386
.model flat, stdcall
option casemap : none

include canvas.inc
include boxing.inc
include data.inc
include logistic.inc
include levels.inc 
include moves.inc

.data
.code

; 主程序
main proc

	invoke GetModuleHandle, NULL
	mov hInstance, eax
	;WinMain
	invoke WinMain, hInstance, 0, 0, SW_SHOWNORMAL
	invoke ExitProcess, eax

main endp
end main
