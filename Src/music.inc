ifndef MUSIC_INC
MUSIC_INC equ <1>
play_music proto
; switch_next_song proto 
;--------mci命令--------
cmd_play BYTE "play ./Assets/GAME.mp3 repeat", 0
cmd_volume BYTE "setaudio ./Assets/GAME.mp3 volume to 800",0
cmd_setStart BYTE "seek./Assets/GAME.mp3 to start", 0
cmd_getLen BYTE "status ./Assets/GAME.mp3 length", 0
cmd_getPos BYTE "status ./Assets/GAME.mp3 position", 0
cmd_repeat BYTE "play ./Assets/GAME.mp3 repeat", 0
;--------当前歌曲信息--------
current_len BYTE 32 dup(0)
current_pos BYTE 32 dup(0)
endif