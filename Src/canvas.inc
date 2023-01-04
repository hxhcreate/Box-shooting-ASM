ifndef CANVAS_INC
CANVAS_INC equ <1>

include data.inc
include boxing.inc
include logistic.inc
include levels.inc
include moves.inc

include canvas.inc
include canvas-utils.inc
.data
; Global Virables

externdef syMainWinId: HWND
externdef syScene: byte

.code
; 函数声明

; 开始游戏
syStartGame proto
; 重置游戏
syResetGame proto
; 进入关卡选择
sySelectLevel proto
; 结束游戏
syEndGame proto Winner:byte

; 设置角色脸朝向
sySetPlayerFace proto Player:byte,u32Face: dword
; 刷新全图
syUpdateMap proto
; 刷新格子
; u32GridInd: dword 格子号
syUpdateGrid proto u32GridInd: dword
; 绘制全图
; devc: HDC 设备上下文id
syDrawMap proto devc: HDC


endif
