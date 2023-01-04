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
Level1MapRow1 dword  0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
Level1MapRow2 dword  1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,1
Level1MapRow3 dword  1,2,2,2,3,4,3,4,3,4,2,2,2,2,2,2,2,2,1,2,2,2,2,5,2,5,2,2,2,1
Level1MapRow4 dword  1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,2,2,2,5,2,2,1
Level1MapRow5 dword  1,1,1,1,1,1,1,2,2,2,8,2,8,2,8,2,2,2,2,2,2,2,5,2,6,2,5,2,2,1
Level1MapRow6 dword  1,2,2,2,2,2,1,2,2,2,9,2,9,2,9,2,2,2,1,2,2,2,5,2,2,2,5,2,2,1
Level1MapRow7 dword  1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,5,2,5,2,2,2,1
Level1MapRow8 dword  1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,1
Level1MapRow9 dword  1,2,2,2,2,2,1,1,2,2,1,1,2,2,8,2,2,2,1,1,2,2,1,1,2,2,2,2,2,1
Level1MapRow10 dword 1,2,2,2,2,2,2,2,2,2,2,1,2,2,9,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1
Level1MapRow11 dword 1,2,2,5,2,5,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1
Level1MapRow12 dword 1,2,5,2,2,2,5,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1
Level1MapRow13 dword 1,2,5,2,6,2,5,2,2,2,2,1,2,2,8,2,8,2,8,2,2,2,2,1,2,2,2,2,2,1
Level1MapRow14 dword 1,2,5,2,2,2,5,2,2,2,2,2,2,2,9,2,9,2,9,2,2,2,2,1,1,1,1,1,1,1
Level1MapRow15 dword 1,2,2,5,2,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
Level1MapRow16 dword 1,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,4,3,4,3,4,3,2,2,2,1
Level1MapRow17 dword 1,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1
Level1MapRow18 dword 0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0

Level2MapRow1 dword  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Level2MapRow2 dword  0,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,5,5,5,5,5,0
Level2MapRow3 dword  0,1,2,2,2,1,0,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,0,5,2,2,2,5,0
Level2MapRow4 dword  0,1,2,3,2,1,1,1,2,2,2,2,3,2,2,2,2,2,2,2,2,2,1,0,5,2,8,2,5,0
Level2MapRow5 dword  0,1,2,3,2,2,2,2,2,8,2,2,2,3,2,2,2,2,2,2,2,2,1,0,5,2,9,2,5,0
Level2MapRow6 dword  0,1,2,2,2,2,2,2,2,9,2,2,2,3,2,2,1,1,1,2,2,2,1,0,5,2,2,2,5,0
Level2MapRow7 dword  0,1,1,1,1,1,1,1,2,2,2,2,3,2,2,2,1,2,2,2,2,2,1,0,5,5,5,5,5,0
Level2MapRow8 dword  0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,0,0,5,6,5,0,0
Level2MapRow9 dword  0,0,0,0,0,0,0,1,3,5,5,5,2,5,5,5,5,2,5,5,5,3,1,0,0,0,5,0,0,0
Level2MapRow10 dword 0,0,0,5,0,0,0,1,3,6,6,6,7,6,6,6,6,7,6,6,6,3,1,0,0,0,0,0,0,0
Level2MapRow11 dword 0,0,5,6,5,0,0,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0
Level2MapRow12 dword 0,5,5,5,5,5,0,1,2,2,2,2,2,1,2,2,2,3,2,2,2,2,1,1,1,1,1,1,1,0
Level2MapRow13 dword 0,5,2,2,2,5,0,1,2,2,2,1,1,1,2,2,3,2,2,2,8,2,2,2,2,2,2,2,1,0
Level2MapRow14 dword 0,5,2,8,2,5,0,1,2,2,2,2,2,2,2,2,3,2,2,2,9,2,2,2,2,2,3,2,1,0
Level2MapRow15 dword 0,5,2,9,2,5,0,1,2,2,2,2,2,2,2,2,2,3,2,2,2,2,1,1,1,2,3,2,1,0
Level2MapRow16 dword 0,5,2,2,2,5,0,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,0,1,2,2,2,1,0
Level2MapRow17 dword 0,5,5,5,5,5,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0
Level2MapRow18 dword 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

Level3MapRow1 dword  0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,3,2,3,2,1
Level3MapRow2 dword  1,1,2,2,2,2,2,2,2,2,2,2,2,2,8,2,2,2,2,8,2,2,1,2,2,2,4,3,2,1
Level3MapRow3 dword  1,2,2,2,2,5,2,2,3,3,3,2,2,2,9,2,2,2,2,9,2,2,1,2,4,3,2,2,2,1
Level3MapRow4 dword  1,2,2,2,2,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,4,1,1,1,1,1,1,1
Level3MapRow5 dword  1,2,2,2,2,2,2,2,3,2,3,2,2,2,2,2,2,8,2,2,2,2,2,2,2,2,2,2,2,1
Level3MapRow6 dword  1,1,1,1,1,5,2,2,2,2,2,2,2,2,2,2,2,9,2,2,2,2,2,2,2,2,2,2,2,1
Level3MapRow7 dword  1,2,2,2,2,5,2,2,3,2,3,1,1,1,8,1,1,1,2,8,2,6,6,7,6,6,2,2,2,1
Level3MapRow8 dword  1,2,2,2,2,5,2,2,2,2,2,1,2,2,9,2,2,1,2,9,2,2,6,7,6,2,2,5,2,1
Level3MapRow9 dword  1,2,2,2,2,2,2,2,2,3,3,1,2,2,2,1,2,1,2,2,2,2,2,7,2,2,2,5,2,1
Level3MapRow10 dword 1,2,1,1,1,5,1,1,1,1,1,1,2,2,2,2,1,8,2,2,2,2,2,2,2,2,5,5,2,1
Level3MapRow11 dword 1,2,1,2,2,5,2,2,2,3,3,1,2,2,2,2,2,9,2,2,2,2,2,7,2,2,2,2,2,1
Level3MapRow12 dword 1,2,1,2,2,5,2,2,2,2,2,1,1,1,8,1,1,1,2,2,8,2,2,7,2,2,2,2,2,1
Level3MapRow13 dword 1,2,1,2,2,2,2,2,3,2,3,2,2,2,9,2,2,2,2,2,9,2,2,2,2,2,2,2,2,1
Level3MapRow14 dword 1,2,1,2,2,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,2,2,2,2,2,1
Level3MapRow15 dword 1,2,2,2,2,5,2,2,3,3,3,2,2,2,2,2,2,8,2,2,2,2,6,7,6,2,2,2,2,1
Level3MapRow16 dword 1,1,2,2,2,5,2,2,2,2,2,2,2,2,8,2,2,9,2,2,2,6,6,7,6,6,2,2,2,1
Level3MapRow17 dword 1,1,2,2,2,2,2,2,2,3,2,2,2,2,9,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1
Level3MapRow18 dword 0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0

Level4MapRow1 dword  0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
Level4MapRow2 dword  1,1,2,2,2,1,1,4,4,4,4,4,1,1,2,2,1,1,4,1,4,1,3,1,1,2,2,2,1,1
Level4MapRow3 dword  1,2,2,2,2,2,2,1,4,3,4,1,2,2,2,2,2,2,1,1,3,1,1,2,2,2,2,2,2,1
Level4MapRow4 dword  1,2,2,2,2,5,2,2,1,3,1,2,2,2,2,3,2,2,2,1,3,1,2,2,8,2,2,2,2,1
Level4MapRow5 dword  1,2,2,2,2,5,2,2,2,1,2,2,2,2,4,2,2,2,2,2,1,2,2,2,9,2,2,2,2,1
Level4MapRow6 dword  1,2,2,5,5,5,2,2,2,7,2,2,2,2,2,2,2,2,2,2,7,2,2,2,2,2,2,8,2,1
Level4MapRow7 dword  1,2,2,2,2,2,2,2,6,7,6,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,9,2,1
Level4MapRow8 dword  1,2,2,2,2,2,2,2,2,7,2,2,2,6,6,6,6,2,2,2,7,2,2,2,8,2,2,2,2,1
Level4MapRow9 dword  1,2,2,2,2,8,2,2,2,2,2,2,2,6,6,6,6,2,2,6,7,6,2,2,9,2,2,2,2,1
Level4MapRow10 dword 1,2,2,2,2,9,2,2,2,7,2,2,2,2,2,2,2,2,2,2,7,2,2,2,2,2,2,2,2,1
Level4MapRow11 dword 1,2,2,2,2,2,2,2,6,7,2,2,2,5,5,5,5,2,2,2,2,2,2,2,2,2,2,2,2,1
Level4MapRow12 dword 1,2,2,3,2,2,2,2,2,7,6,2,2,2,2,2,2,2,2,2,7,2,2,2,2,2,2,2,2,1
Level4MapRow13 dword 1,2,2,3,2,2,2,2,2,7,2,2,2,2,2,2,2,2,2,6,7,6,2,5,5,5,5,2,2,1
Level4MapRow14 dword 1,2,2,4,3,3,2,2,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,5,2,2,2,2,2,1
Level4MapRow15 dword 1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,5,2,2,2,2,2,1
Level4MapRow16 dword 1,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1
Level4MapRow17 dword 1,1,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,1
Level4MapRow18 dword 0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,0

Level5MapRow1 dword  0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
Level5MapRow2 dword  1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,3,3,3,3,3,3,3,3,3,3,1,1
Level5MapRow3 dword  1,2,2,2,3,3,3,3,2,2,8,2,8,2,2,2,2,2,1,1,3,3,3,3,3,3,3,3,3,1
Level5MapRow4 dword  1,2,2,2,3,3,3,3,2,2,9,2,9,2,5,5,2,2,2,2,1,3,3,3,3,3,3,3,3,1
Level5MapRow5 dword  1,2,3,2,2,3,3,3,2,2,2,2,2,2,2,2,2,2,5,2,2,1,1,3,3,3,3,3,3,1
Level5MapRow6 dword  1,2,3,3,2,2,3,3,2,2,2,2,2,5,7,7,5,2,2,2,2,2,2,1,1,1,1,1,1,1
Level5MapRow7 dword  1,2,3,3,3,2,2,3,2,2,2,2,5,2,7,7,2,5,2,2,2,2,2,2,2,2,2,2,2,1
Level5MapRow8 dword  1,2,3,3,3,3,2,2,2,2,2,5,2,2,7,7,2,2,5,2,2,2,2,2,2,2,2,2,2,1
Level5MapRow9 dword  1,2,3,3,3,3,3,2,2,2,2,5,2,6,7,7,6,2,5,2,2,2,2,2,2,2,2,2,2,1
Level5MapRow10 dword 1,2,2,2,2,2,2,2,2,2,2,5,2,2,7,7,2,2,5,2,2,2,2,4,4,4,4,4,2,1
Level5MapRow11 dword 1,2,2,2,2,2,2,2,2,2,2,2,5,2,7,7,2,5,2,2,2,2,2,2,4,4,4,4,2,1
Level5MapRow12 dword 1,2,2,2,2,2,2,2,2,2,2,2,2,5,7,7,5,2,2,2,2,2,4,2,2,4,4,4,2,1
Level5MapRow13 dword 1,1,1,1,1,1,1,2,2,2,5,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,4,4,2,1
Level5MapRow14 dword 1,3,3,3,3,3,3,1,1,2,2,5,5,2,2,2,2,2,2,2,2,2,4,4,4,2,2,4,2,1
Level5MapRow15 dword 1,3,3,3,3,3,3,3,3,1,2,2,2,2,2,2,8,2,2,8,2,2,4,4,4,4,2,2,2,1
Level5MapRow16 dword 1,3,3,3,3,3,3,3,3,3,1,1,2,2,2,2,9,2,2,9,2,2,4,4,4,4,2,2,2,1
Level5MapRow17 dword 1,1,3,3,3,3,3,3,3,3,3,3,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1
Level5MapRow18 dword 0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0

Level6MapRow1 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow2 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow3 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow4 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow5 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow6 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow7 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow8 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow9 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow10 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow11 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow12 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow13 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow14 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow15 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow16 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow17 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level6MapRow18 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

Level7MapRow1 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow2 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow3 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow4 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow5 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow6 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow7 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow8 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow9 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow10 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow11 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow12 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow13 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow14 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow15 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow16 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow17 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level7MapRow18 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

Level8MapRow1 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow2 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow3 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow4 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow5 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow6 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow7 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow8 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow9 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow10 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow11 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow12 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow13 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow14 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow15 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow16 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow17 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level8MapRow18 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

Level9MapRow1 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow2 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow3 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow4 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow5 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow6 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow7 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow8 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow9 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow10 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow11 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow12 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow13 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow14 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow15 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow16 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow17 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level9MapRow18 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

Level10MapRow1 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow2 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow3 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow4 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow5 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow6 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow7 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow8 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow9 dword  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow10 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow11 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow12 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow13 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow14 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow15 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow16 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow17 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Level10MapRow18 dword 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1





.code

LoadMap proc level: byte
	xor ebx, ebx
	.if level == 1
		lea esi, Level1MapRow1
		.while ebx < REC_LEN
			mov edi, dword ptr[esi]
			mov dword ptr CurrentMapText[ebx * 4], edi
			inc ebx
			add esi, 4 
		.endw
	.elseif level == 2
		lea esi, Level2MapRow1
		.while ebx < REC_LEN
			mov edi, dword ptr[esi]
			mov dword ptr CurrentMapText[ebx * 4], edi
			inc ebx
			add esi, 4 
		.endw
	.elseif level == 3
		lea esi, Level3MapRow1
		.while ebx < REC_LEN
			mov edi, dword ptr[esi]
			mov dword ptr CurrentMapText[ebx * 4], edi
			inc ebx
			add esi, 4 
		.endw
	.elseif level == 4
		lea esi, Level4MapRow1
		.while ebx < REC_LEN
			mov edi, dword ptr[esi]
			mov dword ptr CurrentMapText[ebx * 4], edi
			inc ebx
			add esi, 4 
		.endw
	.elseif level == 5
		lea esi, Level5MapRow1
		.while ebx < REC_LEN
			mov edi, dword ptr[esi]
			mov dword ptr CurrentMapText[ebx * 4], edi
			inc ebx
			add esi, 4 
		.endw
	.endif
	ret
LoadMap endp


CreateMap1 proc
	invoke LoadMap, 1
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret

CreateMap1 endp

	; 第二关地图初始化
CreateMap2 proc
	invoke LoadMap, 2
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap2 endp

	; 第三关地图初始化
CreateMap3 proc
	invoke LoadMap, 3
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap3 endp

	; 第四关地图初始化
CreateMap4 proc
	invoke LoadMap, 4
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap4 endp

	; 第五关地图初始化
CreateMap5 proc
	invoke LoadMap, 5
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap5 endp



CreateMap6 proc
	invoke LoadMap, 6
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap6 endp

CreateMap7 proc
	invoke LoadMap, 7
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap7 endp

CreateMap8 proc
	invoke LoadMap, 8
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap8 endp

CreateMap9 proc
	invoke LoadMap, 9
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap9 endp

CreateMap10 proc
	invoke LoadMap, 10
	mov UserPos_1_X, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_1_Y, SY_GRID_SIZE * 2 + SY_GRID_SIZE / 2
	mov UserPos_2_X, SY_GRID_SIZE * (SY_GRID_NUM_X - 3) + SY_GRID_SIZE / 2
	mov UserPos_2_Y, SY_GRID_SIZE * (SY_GRID_NUM_Y - 3) + SY_GRID_SIZE / 2
	ret
CreateMap10 endp



end
