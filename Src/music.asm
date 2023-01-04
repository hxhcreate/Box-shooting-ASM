.386
.model flat, stdcall
option casemap : none

include canvas.inc
include boxing.inc
include data.inc 
include levels.inc
include	music.inc

.code

play_music proc
	;invoke mciSendString, ADDR cmd_volume, NULL, 0, NULL	;调节音量
	;invoke mciSendString, ADDR cmd_play, NULL, 0, NULL	;播放音乐
	;invoke mciSendString, ADDR cmd_volume, NULL, 0, NULL
	;invoke mciSendString, ADDR cmd_repeat, NULL, 0, NULL
	mov eax, SND_LOOP
	or	eax, SND_RESOURCE
	or	eax, SND_ASYNC
	invoke PlaySound, IDR_WAVE1, hInstance, eax
	ret
play_music endp	

; switch_next_song proc
; 	local temp: DWORD
; 	invoke StrToInt, addr current_len
; 	mov temp, eax
; 	invoke StrToInt, addr current_pos
; 	.if eax >= temp	
; 		invoke mciSendString, addr cmd_setStart, NULL, 0, NULL
; 		invoke mciSendString, ADDR cmd_volume, NULL, 0, NULL	;调节音量
; 		invoke mciSendString, addr cmd_play, NULL, 0, NULL
; 	.endif	
; 	Ret
; switch_next_song endp

end