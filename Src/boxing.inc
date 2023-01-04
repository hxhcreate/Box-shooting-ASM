ifndef BOXING_INC
BOXING_INC equ <1>

include windows.inc
include user32.inc
include kernel32.inc
include comctl32.inc
include masm32.inc
include shell32.inc
include gdi32.inc
include msvcrt.inc
INCLUDE	winmm.inc
INCLUDE	comdlg32.inc
INCLUDE shlwapi.inc
INCLUDE gdiplus.inc
INCLUDE wsock32.inc




includelib user32.lib
includelib kernel32.lib
includelib comctl32.lib
includelib masm32.lib
includelib gdi32.lib
includelib msvcrt.lib
INCLUDELIB shlwapi.lib
INCLUDELIB winmm.lib
INCLUDELIB gdiplus.lib
INCLUDELIB wsock32.lib
INCLUDELIB comdlg32.lib

includelib ucrt.lib  ;这个库里面有C函数的实现.
includelib legacy_stdio_definitions.lib  ;C函数的声明

endif
