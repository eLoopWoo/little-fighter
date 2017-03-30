.486
.model flat, stdcall
option casemap : none

init proto


include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\msvcrt.inc
includelib msvcrt.lib
include drd.inc
includelib drd.lib

includelib \masm32\lib\winmm.lib
include \masm32\include\winmm.inc

.data
Random db 0
Side db 0
movementWalk dd 0
Jump db 0
Punch db 0
PunchHand db 0
EnergyBall db 0
NoKey db 0
rockSide dd 0

STime SYSTEMTIME{}; at: proc Random
TimerStop DWORD 0

Soundfile db "Maple_Story_Music_Lith_Harbor.wav", 0

lionforestLF2Name Byte "lionforestLF2.bmp", 0
lionforestLF2 Img <0, 0, 0, 0>

DavisStandLeftName BYTE "DavisStandLeft.bmp", 0
DavisStandLeft Img <0, 0, 0, 0>

DavisStandRightName BYTE "DavisStandRight.bmp", 0
DavisStandRight Img <0, 0, 0, 0>

DavisWalk1LeftName BYTE "DavisWalk1Left.bmp", 0
DavisWalk1Left Img <0, 0, 0, 0>

DavisWalk1RightName BYTE "DavisWalk1Right.bmp", 0
DavisWalk1Right Img <0, 0, 0, 0>

DavisWalk2LeftName BYTE "DavisWalk2Left.bmp", 0
DavisWalk2Left Img <0, 0, 0, 0>

DavisWalk2RightName BYTE "DavisWalk2Right.bmp", 0
DavisWalk2Right Img <0, 0, 0, 0>

DavisWalk3LeftName BYTE "DavisWalk3Left.bmp", 0
DavisWalk3Left Img <0, 0, 0, 0>

DavisWalk3RightName BYTE "DavisWalk3Right.bmp", 0
DavisWalk3Right Img <0, 0, 0, 0>

DavisWalk4LeftName BYTE "DavisWalk4Left.bmp", 0
DavisWalk4Left Img <0, 0, 0, 0>

DavisWalk4RightName BYTE "DavisWalk4Right.bmp", 0
DavisWalk4Right Img <0, 0, 0, 0>

DavisJump1RightName Byte "DavisJump1Right.bmp", 0
DavisJump1Right Img <0, 0, 0, 0>

DavisJump1LeftName Byte "DavisJump1Left.bmp", 0
DavisJump1Left Img <0, 0, 0, 0>

DavisJump2RightName Byte "DavisJump2Right.bmp", 0
DavisJump2Right Img <0, 0, 0, 0>

DavisJump2LeftName Byte "DavisJump2Left.bmp", 0
DavisJump2Left Img <0, 0, 0, 0>

DavisJump3RightName Byte "DavisJump3Right.bmp", 0
DavisJump3Right Img <0, 0, 0, 0>

DavisJump3LeftName Byte "DavisJump3Left.bmp", 0
DavisJump3Left Img <0, 0, 0, 0>

DavisPunch1RightName Byte "DavisPunch1Right.bmp", 0
DavisPunch1Right Img <0, 0, 0, 0>

DavisPunch1LeftName Byte "DavisPunch1Left.bmp", 0
DavisPunch1Left Img <0, 0, 0, 0>

DavisPunch2RightName Byte "DavisPunch2Right.bmp", 0
DavisPunch2Right Img <0, 0, 0, 0>

DavisPunch2LeftName Byte "DavisPunch2Left.bmp", 0
DavisPunch2Left Img <0, 0, 0, 0>

DavisPunch3RightName Byte "DavisPunch3Right.bmp", 0
DavisPunch3Right Img <0, 0, 0, 0>

DavisPunch3LeftName Byte "DavisPunch3Left.bmp", 0
DavisPunch3Left Img <0, 0, 0, 0>

DavisPunch4RightName Byte "DavisPunch4Right.bmp", 0
DavisPunch4Right Img <0, 0, 0, 0>

DavisPunch4LeftName Byte "DavisPunch4Left.bmp", 0
DavisPunch4Left Img <0, 0, 0, 0>

DavisPunch5RightName Byte "DavisPunch5Right.bmp", 0
DavisPunch5Right Img <0, 0, 0, 0>

DavisPunch5LeftName Byte "DavisPunch5Left.bmp", 0
DavisPunch5Left Img <0, 0, 0, 0>

DavisPunch6RightName Byte "DavisPunch6Right.bmp", 0
DavisPunch6Right Img <0, 0, 0, 0>

DavisPunch6LeftName Byte "DavisPunch6Left.bmp", 0
DavisPunch6Left Img <0, 0, 0, 0>

DavisPunch7RightName Byte "DavisPunch7Right.bmp", 0
DavisPunch7Right Img <0, 0, 0, 0>

DavisPunch7LeftName Byte "DavisPunch7Left.bmp", 0
DavisPunch7Left Img <0, 0, 0, 0>

DavisEnergyBallStance1RightName Byte "DavisEnergyBallStance1Right.bmp", 0
DavisEnergyBallStance1Right Img <0, 0, 0, 0>

DavisEnergyBallStance1LeftName Byte "DavisEnergyBallStance1Left.bmp", 0
DavisEnergyBallStance1Left Img <0, 0, 0, 0>

DavisEnergyBallStance2RightName Byte "DavisEnergyBallStance2Right.bmp", 0
DavisEnergyBallStance2Right Img <0, 0, 0, 0>

DavisEnergyBallStance2LeftName Byte "DavisEnergyBallStance2Left.bmp", 0
DavisEnergyBallStance2Left Img <0, 0, 0, 0>

DavisEnergyBallStance3RightName Byte "DavisEnergyBallStance3Right.bmp", 0
DavisEnergyBallStance3Right Img <0, 0, 0, 0>

DavisEnergyBallStance3LeftName Byte "DavisEnergyBallStance3Left.bmp", 0
DavisEnergyBallStance3Left Img <0, 0, 0, 0>

DavisEnergyBallStance4RightName Byte "DavisEnergyBallStance4Right.bmp", 0
DavisEnergyBallStance4Right Img <0, 0, 0, 0>

DavisEnergyBallStance4LeftName Byte "DavisEnergyBallStance4Left.bmp", 0
DavisEnergyBallStance4Left Img <0, 0, 0, 0>

DavisEnergyBallStance5RightName Byte "DavisEnergyBallStance5Right.bmp", 0
DavisEnergyBallStance5Right Img <0, 0, 0, 0>

DavisEnergyBallStance5LeftName Byte "DavisEnergyBallStance5Left.bmp", 0
DavisEnergyBallStance5Left Img <0, 0, 0, 0>

DavisEnergyBallStance6RightName Byte "DavisEnergyBallStance6Right.bmp", 0
DavisEnergyBallStance6Right Img <0, 0, 0, 0>

DavisEnergyBallStance6LeftName Byte "DavisEnergyBallStance6Left.bmp", 0
DavisEnergyBallStance6Left Img <0, 0, 0, 0>

DavisEnergyBallStance7RightName Byte "DavisEnergyBallStance7Right.bmp", 0
DavisEnergyBallStance7Right Img <0, 0, 0, 0>

DavisEnergyBallStance7LeftName Byte "DavisEnergyBallStance7Left.bmp", 0
DavisEnergyBallStance7Left Img <0, 0, 0, 0>

DavisEnergyBallStance8RightName Byte "DavisEnergyBallStance8Right.bmp", 0
DavisEnergyBallStance8Right Img <0, 0, 0, 0>

DavisEnergyBallStance8LeftName Byte "DavisEnergyBallStance8Left.bmp", 0
DavisEnergyBallStance8Left Img <0, 0, 0, 0>

DavisEnergyBallStance9RightName Byte "DavisEnergyBallStance9Right.bmp", 0
DavisEnergyBallStance9Right Img <0, 0, 0, 0>

DavisEnergyBallStance9LeftName Byte "DavisEnergyBallStance9Left.bmp", 0
DavisEnergyBallStance9Left Img <0, 0, 0, 0>

DavisEnergyBallStance10RightName Byte "DavisEnergyBallStance10Right.bmp", 0
DavisEnergyBallStance10Right Img <0, 0, 0, 0>

DavisEnergyBallStance10LeftName Byte "DavisEnergyBallStance10Left.bmp", 0
DavisEnergyBallStance10Left Img <0, 0, 0, 0>

DavisEnergyBall1RightName Byte "DavisEnergyBall1Right.bmp", 0
DavisEnergyBall1Right Img <0, 0, 0, 0>

DavisEnergyBall1LeftName Byte "DavisEnergyBall1Left.bmp", 0
DavisEnergyBall1Left Img <0, 0, 0, 0>

DavisEnergyBall2RightName Byte "DavisEnergyBall2Right.bmp", 0
DavisEnergyBall2Right Img <0, 0, 0, 0>

DavisEnergyBall2LeftName Byte "DavisEnergyBall2Left.bmp", 0
DavisEnergyBall2Left Img <0, 0, 0, 0>

DavisEnergyBall3RightName Byte "DavisEnergyBall3Right.bmp", 0
DavisEnergyBall3Right Img <0, 0, 0, 0>

DavisEnergyBall3LeftName Byte "DavisEnergyBall3Left.bmp", 0
DavisEnergyBall3Left Img <0, 0, 0, 0>

DavisEnergyBall4RightName Byte "DavisEnergyBall4Right.bmp", 0
DavisEnergyBall4Right Img <0, 0, 0, 0>

DavisEnergyBall4LeftName Byte "DavisEnergyBall4Left.bmp", 0
DavisEnergyBall4Left Img <0, 0, 0, 0>

DavisEnergyBall5RightName Byte "DavisEnergyBall5Right.bmp", 0
DavisEnergyBall5Right Img <0, 0, 0, 0>

DavisEnergyBall5LeftName Byte "DavisEnergyBall5Left.bmp", 0
DavisEnergyBall5Left Img <0, 0, 0, 0>

DavisEnergyBall6RightName Byte "DavisEnergyBall6Right.bmp", 0
DavisEnergyBall6Right Img <0, 0, 0, 0>

DavisEnergyBall6LeftName Byte "DavisEnergyBall6Left.bmp", 0
DavisEnergyBall6Left Img <0, 0, 0, 0>

DavisEnergyBall7RightName Byte "DavisEnergyBall7Right.bmp", 0
DavisEnergyBall7Right Img <0, 0, 0, 0>

DavisEnergyBall7LeftName Byte "DavisEnergyBall7Left.bmp", 0
DavisEnergyBall7Left Img <0, 0, 0, 0>

Rock1Name Byte "Rock1.bmp", 0
Rock1 Img <0, 0, 0, 0>

Rock2Name Byte "Rock2.bmp", 0
Rock2 Img <0, 0, 0, 0>

Rock3Name Byte "Rock3.bmp", 0
Rock3 Img <0, 0, 0, 0>

Rock4Name Byte "Rock4.bmp", 0
Rock4 Img <0, 0, 0, 0>

Rock5Name Byte "Rock5.bmp", 0
Rock5 Img <0, 0, 0, 0>

gameOverName Byte "gameOver.bmp", 0
gameOver Img <0, 0, 0, 0>


dstX DWORD 160
dstY DWORD 750

dstXX DWORD 0
dstYY DWORD 0

dstRockX DWORD 0
dstRockY DWORD 500



.code

X macro args : VARARG
asm_txt TEXTEQU <>
FORC char, <&args>
IFDIF <&char>, <!\>
asm_txt CATSTR asm_txt, <&char>
ELSE
asm_txt
asm_txt TEXTEQU <>
ENDIF
ENDM
asm_txt
endm


move PROC, vkey:DWORD

pusha

jmp gameOver1
Keys :

cmp eax, 25h;//left
je leftDraw

cmp eax, 26h;//up
je upDraw

cmp eax, 27h;//right
je rightDraw

cmp eax, 28h;//down
je downDraw

cmp eax, 20h;//spaceBar
je jumpDraw

cmp eax, 43h;//c
je punchDraw

cmp eax, 56h;//v
je energyballDraw


mov NoKey, 1
jmp endMovement

gameOver1 :

;// if Rock+120 less than Man jump
mov ebx, [dstRockX]
add ebx, 120
cmp ebx, dstX
jb fg

;// if Man+150 less than Rock jump
mov ebx, [dstX]
add ebx, 150
cmp ebx, dstRockX
jb fg


;// if RockY + 120  less than Man jump
mov ebx, [dstRockY]
add ebx, 120
cmp ebx, dstY
jb fg

;//if ManY + 100 less than RockY jump
mov ebx, [dstY]
add ebx, 100
cmp ebx, dstRockY
jb fg

mov bp, 1000
mov si, 2; //number of iterations of bp

delayEnd:
nop
invoke drd_flip
invoke drd_imageDraw, offset gameOver, 0, 0
invoke drd_flip
dec bp
jnz delayEnd
mov bp, 10
dec si
cmp si, 0
invoke ExitProcess, 0
jnz delayEnd

jmp endMovement

fg :
jmp Keys

leftDraw :
cmp dstX, 160
jbe stopLeft
sub dstX, 20
jmp drawLeft
stopLeft :
mov dstX, 160
jmp drawLeft

upDraw :
cmp dstY, 460
jbe stopUp
sub dstY, 20
jmp drawUpDown
stopUp :
mov dstY, 460
jmp drawUpDown

rightDraw :
cmp dstX, 1620
je stopRight
add dstX, 20
jmp drawRight
stopRight :
mov dstX, 1620
jmp drawRight

downDraw :
cmp dstY, 840
jae stopDown
add dstY, 20
jmp drawUpDown
stopDown :
mov dstY, 840
jmp drawUpDown

jumpDraw :
jmp drawUpDownJump

punchDraw :
jmp drawUpDownPunch

energyballDraw :
jmp drawEnergyBall

drawLeft :
mov[Side], 1
add[movementWalk], 1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
jmp endMovement

drawUpDown :
add[movementWalk], 1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
jmp endMovement

drawRight :
mov[Side], 0
add[movementWalk], 1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
jmp endMovement

drawUpDownJump :
add[movementWalk], 1
mov[Jump], 1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
jmp endMovement

drawUpDownPunch :
add[movementWalk], 1
mov[Punch], 1
inc[PunchHand]
invoke drd_imageDraw, offset lionforestLF2, 0, 0
jmp endMovement

drawEnergyBall :
add[movementWalk], 1
inc[PunchHand]
mov[EnergyBall], 1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
jmp endMovement

endMovement :

popa
ret
move ENDP

main PROC

invoke drd_init, 1980, 1280, INIT_WINDOW
invoke PlaySound, addr Soundfile, NULL, SND_ASYNC

invoke drd_imageLoadFile, offset lionforestLF2Name, offset lionforestLF2


invoke drd_imageLoadFile, offset DavisStandLeftName, offset DavisStandLeft
invoke drd_imageLoadFile, offset DavisStandRightName, offset DavisStandRight

invoke drd_imageLoadFile, offset DavisWalk1RightName, offset DavisWalk1Right
invoke drd_imageLoadFile, offset DavisWalk2RightName, offset DavisWalk2Right
invoke drd_imageLoadFile, offset DavisWalk3RightName, offset DavisWalk3Right
invoke drd_imageLoadFile, offset DavisWalk4RightName, offset DavisWalk4Right

invoke drd_imageLoadFile, offset DavisWalk1LeftName, offset DavisWalk1Left
invoke drd_imageLoadFile, offset DavisWalk2LeftName, offset DavisWalk2Left
invoke drd_imageLoadFile, offset DavisWalk3LeftName, offset DavisWalk3Left
invoke drd_imageLoadFile, offset DavisWalk4LeftName, offset DavisWalk4Left


invoke drd_imageLoadFile, offset DavisJump1RightName, offset DavisJump1Right
invoke drd_imageLoadFile, offset DavisJump2RightName, offset DavisJump2Right
invoke drd_imageLoadFile, offset DavisJump3RightName, offset DavisJump3Right

invoke drd_imageLoadFile, offset DavisJump1LeftName, offset DavisJump1Left
invoke drd_imageLoadFile, offset DavisJump2LeftName, offset DavisJump2Left
invoke drd_imageLoadFile, offset DavisJump3LeftName, offset DavisJump3Left

invoke drd_imageLoadFile, offset DavisPunch1RightName, offset DavisPunch1Right
invoke drd_imageLoadFile, offset DavisPunch2RightName, offset DavisPunch2Right
invoke drd_imageLoadFile, offset DavisPunch3RightName, offset DavisPunch3Right
invoke drd_imageLoadFile, offset DavisPunch4RightName, offset DavisPunch4Right
invoke drd_imageLoadFile, offset DavisPunch5RightName, offset DavisPunch5Right
invoke drd_imageLoadFile, offset DavisPunch6RightName, offset DavisPunch6Right
invoke drd_imageLoadFile, offset DavisPunch7RightName, offset DavisPunch7Right

invoke drd_imageLoadFile, offset DavisPunch1LeftName, offset DavisPunch1Left
invoke drd_imageLoadFile, offset DavisPunch2LeftName, offset DavisPunch2Left
invoke drd_imageLoadFile, offset DavisPunch3LeftName, offset DavisPunch3Left
invoke drd_imageLoadFile, offset DavisPunch3LeftName, offset DavisPunch3Left
invoke drd_imageLoadFile, offset DavisPunch4LeftName, offset DavisPunch4Left
invoke drd_imageLoadFile, offset DavisPunch5LeftName, offset DavisPunch5Left
invoke drd_imageLoadFile, offset DavisPunch6LeftName, offset DavisPunch6Left
invoke drd_imageLoadFile, offset DavisPunch7LeftName, offset DavisPunch7Left

invoke drd_imageLoadFile, offset DavisEnergyBallStance1RightName, offset DavisEnergyBallStance1Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance2RightName, offset DavisEnergyBallStance2Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance3RightName, offset DavisEnergyBallStance3Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance4RightName, offset DavisEnergyBallStance4Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance5RightName, offset DavisEnergyBallStance5Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance6RightName, offset DavisEnergyBallStance6Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance7RightName, offset DavisEnergyBallStance7Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance8RightName, offset DavisEnergyBallStance8Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance9RightName, offset DavisEnergyBallStance9Right
invoke drd_imageLoadFile, offset DavisEnergyBallStance10RightName, offset DavisEnergyBallStance10Right

invoke drd_imageLoadFile, offset DavisEnergyBallStance1LeftName, offset DavisEnergyBallStance1Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance2LeftName, offset DavisEnergyBallStance2Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance3LeftName, offset DavisEnergyBallStance3Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance4LeftName, offset DavisEnergyBallStance4Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance5LeftName, offset DavisEnergyBallStance5Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance6LeftName, offset DavisEnergyBallStance6Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance7LeftName, offset DavisEnergyBallStance7Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance8LeftName, offset DavisEnergyBallStance8Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance9LeftName, offset DavisEnergyBallStance9Left
invoke drd_imageLoadFile, offset DavisEnergyBallStance10LeftName, offset DavisEnergyBallStance10Left

invoke drd_imageLoadFile, offset DavisEnergyBall1RightName, offset DavisEnergyBall1Right
invoke drd_imageLoadFile, offset DavisEnergyBall2RightName, offset DavisEnergyBall2Right
invoke drd_imageLoadFile, offset DavisEnergyBall3RightName, offset DavisEnergyBall3Right
invoke drd_imageLoadFile, offset DavisEnergyBall4RightName, offset DavisEnergyBall4Right
invoke drd_imageLoadFile, offset DavisEnergyBall5RightName, offset DavisEnergyBall5Right
invoke drd_imageLoadFile, offset DavisEnergyBall6RightName, offset DavisEnergyBall6Right
invoke drd_imageLoadFile, offset DavisEnergyBall7RightName, offset DavisEnergyBall7Right

invoke drd_imageLoadFile, offset DavisEnergyBall1LeftName, offset DavisEnergyBall1Left
invoke drd_imageLoadFile, offset DavisEnergyBall2LeftName, offset DavisEnergyBall2Left
invoke drd_imageLoadFile, offset DavisEnergyBall3LeftName, offset DavisEnergyBall3Left
invoke drd_imageLoadFile, offset DavisEnergyBall4LeftName, offset DavisEnergyBall4Left
invoke drd_imageLoadFile, offset DavisEnergyBall5LeftName, offset DavisEnergyBall5Left
invoke drd_imageLoadFile, offset DavisEnergyBall6LeftName, offset DavisEnergyBall6Left
invoke drd_imageLoadFile, offset DavisEnergyBall7LeftName, offset DavisEnergyBall7Left

invoke drd_imageLoadFile, offset Rock1Name, offset Rock1
invoke drd_imageLoadFile, offset Rock2Name, offset Rock2
invoke drd_imageLoadFile, offset Rock3Name, offset Rock3
invoke drd_imageLoadFile, offset Rock4Name, offset Rock4
invoke drd_imageLoadFile, offset Rock5Name, offset Rock5

invoke drd_imageLoadFile, offset gameOverName, offset gameOver



start :
invoke drd_processMessages

invoke drd_imageSetTransparent, offset DavisStandRight, 0
invoke drd_imageSetTransparent, offset DavisStandLeft, 0

invoke drd_imageSetTransparent, offset DavisWalk1Left, 0
invoke drd_imageSetTransparent, offset DavisWalk2Left, 0
invoke drd_imageSetTransparent, offset DavisWalk3Left, 0
invoke drd_imageSetTransparent, offset DavisWalk4Left, 0
invoke drd_imageSetTransparent, offset DavisJump1Left, 0
invoke drd_imageSetTransparent, offset DavisJump2Left, 0
invoke drd_imageSetTransparent, offset DavisJump3Left, 0
invoke drd_imageSetTransparent, offset DavisPunch1Left, 0
invoke drd_imageSetTransparent, offset DavisPunch2Left, 0
invoke drd_imageSetTransparent, offset DavisPunch3Left, 0
invoke drd_imageSetTransparent, offset DavisPunch4Left, 0
invoke drd_imageSetTransparent, offset DavisPunch5Left, 0
invoke drd_imageSetTransparent, offset DavisPunch6Left, 0
invoke drd_imageSetTransparent, offset DavisPunch7Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance1Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance2Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance3Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance4Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance5Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance6Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance7Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance8Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance9Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance10Left, 0



invoke drd_imageSetTransparent, offset DavisEnergyBall1Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall2Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall3Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall4Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall5Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall6Left, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall7Left, 0



invoke drd_imageSetTransparent, offset DavisWalk1Right, 0
invoke drd_imageSetTransparent, offset DavisWalk2Right, 0
invoke drd_imageSetTransparent, offset DavisWalk3Right, 0
invoke drd_imageSetTransparent, offset DavisWalk4Right, 0
invoke drd_imageSetTransparent, offset DavisJump1Right, 0
invoke drd_imageSetTransparent, offset DavisJump2Right, 0
invoke drd_imageSetTransparent, offset DavisJump3Right, 0
invoke drd_imageSetTransparent, offset DavisPunch1Right, 0
invoke drd_imageSetTransparent, offset DavisPunch2Right, 0
invoke drd_imageSetTransparent, offset DavisPunch3Right, 0
invoke drd_imageSetTransparent, offset DavisPunch4Right, 0
invoke drd_imageSetTransparent, offset DavisPunch5Right, 0
invoke drd_imageSetTransparent, offset DavisPunch6Right, 0
invoke drd_imageSetTransparent, offset DavisPunch7Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance1Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance2Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance3Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance4Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance5Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance6Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance7Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance8Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance9Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBallStance10Right, 0


invoke drd_imageSetTransparent, offset DavisEnergyBall1Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall2Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall3Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall4Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall5Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall6Right, 0
invoke drd_imageSetTransparent, offset DavisEnergyBall7Right, 0

invoke drd_imageSetTransparent, offset Rock1, 0
invoke drd_imageSetTransparent, offset Rock2, 0
invoke drd_imageSetTransparent, offset Rock3, 0
invoke drd_imageSetTransparent, offset Rock4, 0
invoke drd_imageSetTransparent, offset Rock5, 0



invoke drd_imageDraw, offset lionforestLF2, 0, 0




invoke drd_setKeyHandler, move

cmp NoKey, 1

je DavisIdle


cmp[EnergyBall], 1
je EnergyBallMovement
cmp[Punch], 1
je PunchMovement
cmp[Jump], 1
je JumpMovement
cmp[Side], 1
jne GotoRight

mov edx, 0
mov eax, [movementWalk]
mov ecx, 5
div ecx
cmp edx, 0
je StandLeft
cmp edx, 1
je Walk1Left
cmp edx, 2
je Walk2Left
cmp edx, 3
je Walk3Left
cmp edx, 4
je Walk4Left

StandLeft :
invoke drd_imageDraw, offset DavisStandLeft, dstX, dstY
;		jmp gameOver1
jmp endAnimationLeft

Walk1Left :
invoke drd_imageDraw, offset DavisWalk1Left, dstX, dstY
jmp endAnimationLeft

Walk2Left :
invoke drd_imageDraw, offset DavisWalk2Left, dstX, dstY
jmp endAnimationLeft

Walk3Left :
invoke drd_imageDraw, offset DavisWalk3Left, dstX, dstY
jmp endAnimationLeft

Walk4Left :
invoke drd_imageDraw, offset DavisWalk4Left, dstX, dstY
jmp endAnimationLeft


endAnimationLeft :
jmp endSide


GotoRight :
mov edx, 0
mov eax, [movementWalk]
mov ecx, 5
div ecx
cmp edx, 0
je StandRight
cmp edx, 1
je Walk1Right
cmp edx, 2
je Walk2Right
cmp edx, 3
je Walk3Right
cmp edx, 4
je Walk4Right

StandRight :
invoke drd_imageDraw, offset DavisStandRight, dstX, dstY
jmp endAnimationLeft

Walk1Right :
invoke drd_imageDraw, offset DavisWalk1Right, dstX, dstY
jmp endAnimationLeft

Walk2Right :
invoke drd_imageDraw, offset DavisWalk2Right, dstX, dstY
jmp endAnimationLeft

Walk3Right :
invoke drd_imageDraw, offset DavisWalk3Right, dstX, dstY
jmp endAnimationLeft

Walk4Right :
invoke drd_imageDraw, offset DavisWalk4Right, dstX, dstY
jmp endSide

JumpMovement :

cmp[Side], 1
jne GotoRightJump

sub dstY, 10
invoke drd_imageDraw, offset DavisJump3Left, dstX, dstY
invoke drd_flip
sub dstY, 40
call Delay
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisJump2Left, dstX, dstY
invoke drd_flip
call Delay
add dstY, 30
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisJump3Left, dstX, dstY
invoke drd_flip
call Delay
invoke drd_flip
add dstY, 20
mov[Jump], 0
mov[movementWalk], 0
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandLeft, dstX, dstY
call Delay
jmp endSide


GotoRightJump :
sub dstY, 10
invoke drd_imageDraw, offset DavisJump3Right, dstX, dstY
invoke drd_flip
sub dstY, 40
call Delay
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisJump2Right, dstX, dstY
invoke drd_flip
call Delay
add dstY, 30
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisJump3Right, dstX, dstY
invoke drd_flip
call Delay
invoke drd_flip
add dstY, 20
mov[Jump], 0
mov[movementWalk], 0
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandRight, dstX, dstY
call Delay

jmp endSide

Delay :
call gameOver2
call RockRestart
call RockRestart

mov bp, 150
mov si, 150
delay2:
dec bp
nop
jnz delay2
dec si
cmp si, 0
jnz delay2

call RockRestart
call RockRestart
call gameOver2
mov bp, 150
mov si, 150
delay23:
dec bp
nop
jnz delay23
dec si
cmp si, 0
jnz delay23

call RockRestart
call RockRestart
call gameOver2
mov bp, 150
mov si, 150
delay22:
dec bp
nop
jnz delay22
dec si
cmp si, 0
jnz delay22

call RockRestart
call RockRestart
call gameOver2
mov bp, 150
mov si, 150
delay232:
dec bp
nop
jnz delay232
dec si
cmp si, 0
jnz delay232

call RockRestart
call RockRestart
mov bp, 150
mov si, 150
delay222:
dec bp
nop
jnz delay222
dec si
cmp si, 0
jnz delay222

call RockRestart
call RockRestart
mov bp, 150
mov si, 150
delay2223:
dec bp
nop
jnz delay2223
dec si
cmp si, 0
jnz delay2223

call RockRestart
call RockRestart
mov bp, 150
mov si, 150
delay2222:
dec bp
nop
jnz delay2222
dec si
cmp si, 0
jnz delay2222
call RockRestart
call RockRestart
mov bp, 150
mov si, 150
delay22222:
dec bp
nop
jnz delay22222
dec si
cmp si, 0
jnz delay22222
call RockRestart
call RockRestart
ret



Delay1 :
call RockRestart
call RockRestart
mov bp, 125
mov si, 125
delay3 :
	dec bp
	nop
	jnz delay3
	dec si
	cmp si, 0
	jnz delay3

	call RockRestart
	call RockRestart
	mov bp, 125
	mov si, 125
	delay39:
dec bp
nop
jnz delay39
dec si
cmp si, 0
jnz delay39

call RockRestart
call RockRestart
mov bp, 125
mov si, 125
delay33:
dec bp
nop
jnz delay33
dec si
cmp si, 0
jnz delay33

call RockRestart
call RockRestart
call gameOver2
mov bp, 125
mov si, 125
delay339:
dec bp
nop
jnz delay339
dec si
cmp si, 0
jnz delay339

call RockRestart
call RockRestart
call gameOver2
mov bp, 125
mov si, 125
delay333:
dec bp
nop
jnz delay333
dec si
cmp si, 0
jnz delay333

call RockRestart
call RockRestart
mov bp, 125
mov si, 125
delay3339:
dec bp
nop
jnz delay3339
dec si
cmp si, 0
jnz delay3339

call RockRestart
call RockRestart
mov bp, 125
mov si, 125
delay3333:
dec bp
nop
jnz delay3333
dec si
cmp si, 0
jnz delay3333

call RockRestart
call RockRestart
mov bp, 125
mov si, 125
delay33339:
dec bp
nop
jnz delay33339
dec si
cmp si, 0; call gameOver1
jnz delay33339
call RockRestart
call RockRestart
ret


Delay5 :
call RockRestart
call RockRestart
mov bp, 150
mov si, 150
delay4 :
	dec bp
	nop
	jnz delay4
	dec si
	cmp si, 0
	jnz delay4
	call RockRestart
	call RockRestart

	mov bp, 150
	mov si, 150
	delay44:
dec bp
nop
jnz delay44
dec si
cmp si, 0
jnz delay44
call RockRestart
call RockRestart
call RockRestart

mov bp, 150
mov si, 150
delay444:
dec bp
nop
jnz delay444
dec si
cmp si, 0
jnz delay444
call RockRestart
call RockRestart

mov bp, 150
mov si, 150
delay4444:
dec bp
nop
jnz delay4444
dec si
cmp si, 0
jnz delay4444
call RockRestart
call RockRestart
call gameOver2
ret

gameOver2 :

;//if Rock+150 less than Man jump
mov ebx, [dstRockX]
add ebx, 120
cmp ebx, dstX
jb fg

;//if Man+201 less than Rock jump
mov ebx, [dstX]
add ebx, 150
cmp ebx, dstRockX
jb fg


;//if RockY + 150  less than Man jump
mov ebx, [dstRockY]
add ebx, 100
cmp ebx, dstY
jb fg

;//if ManY + 201 less than RockY jump
mov ebx, [dstY]
add ebx, 100
cmp ebx, dstRockY
jb fg

mov bp, 10000
mov si, 2;//number of iterations of bp
delayEnd1:
nop
invoke drd_flip
invoke drd_imageDraw, offset gameOver, 0, 0
invoke drd_flip
dec bp
jnz delayEnd1
mov bp, 10
dec si
cmp si, 0
jnz delayEnd1

fg :
ret

PunchMovement :
cmp[Side], 1
jne GotoRightPunch

add[PunchHand], 0
jp LeftRightHand

invoke drd_imageDraw, offset DavisPunch1Left, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch2Left, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch3Left, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch7Left, dstX, dstY
invoke drd_flip
call Delay1
call Delay1
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandLeft, dstX, dstY
invoke drd_flip
mov[Punch], 0
mov[movementWalk], 0
jmp endSide

LeftRightHand :

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch4Left, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch5Left, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch6Left, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch7Left, dstX, dstY
invoke drd_flip
call Delay1
call Delay1
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandLeft, dstX, dstY
invoke drd_flip
mov[Punch], 0
mov[movementWalk], 0
jmp endSide


GotoRightPunch :

add[PunchHand], 0
jp RightRightHand

invoke drd_imageDraw, offset DavisPunch1Right, dstX, dstY
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch2Right, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch3Right, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch7Right, dstX, dstY
invoke drd_flip
call Delay1
call Delay1
call Delay1

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandRight, dstX, dstY
invoke drd_flip
mov[Punch], 0
mov[movementWalk], 0
jmp endSide

RightRightHand :

invoke drd_imageDraw, offset DavisPunch4Right, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch5Right, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch6Right, dstX, dstY
invoke drd_flip
call Delay1
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisPunch7Right, dstX, dstY
invoke drd_flip
call Delay1
call Delay1
call Delay1

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandRight, dstX, dstY
invoke drd_flip
mov[Punch], 0
mov[movementWalk], 0
jmp endSide



EnergyBallMovement :


cmp[Side], 1
jne GotoRightEnergyBall

add[PunchHand], 0
jp LeftRightHandEnergy

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance1Left, dstX, dstY
mov ebx, dstY
add ebx, 50
mov dstYY, ebx
mov ebx, dstX
sub ebx, 20
mov dstXX, ebx
sub dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall1Left, dstXX, dstYY

invoke drd_flip
call Delay5


invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance6Left, dstX, dstY
sub dstXX, 10
invoke drd_imageDraw, offset DavisEnergyBall2Left, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance7Left, dstX, dstY
sub dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall3Left, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance8Left, dstX, dstY
sub dstXX, 10
invoke drd_imageDraw, offset DavisEnergyBall4Left, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance9Left, dstX, dstY
sub dstXX, 35
invoke drd_imageDraw, offset DavisEnergyBall5Left, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance10Left, dstX, dstY
sub dstXX, 25
invoke drd_imageDraw, offset DavisEnergyBall6Left, dstXX, dstYY
invoke drd_imageDraw, offset DavisEnergyBall7Left, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandLeft, dstX, dstY
invoke drd_imageDraw, offset DavisEnergyBall7Left, dstXX, dstYY
call Delay5


invoke drd_flip

mov[movementWalk], 0
jmp endSide







LeftRightHandEnergy:

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance1Left, dstX, dstY
mov ebx, dstY
add ebx, 50
mov dstYY, ebx
mov ebx, dstX
sub ebx, 20
mov dstXX, ebx
sub dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall1Left, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance2Left, dstX, dstY
sub dstXX, 10
invoke drd_imageDraw, offset DavisEnergyBall2Left, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance3Left, dstX, dstY
sub dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall3Left, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance4Left, dstX, dstY
sub dstXX, 35
invoke drd_imageDraw, offset DavisEnergyBall4Left, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance5Left, dstX, dstY
sub dstXX, 25
invoke drd_imageDraw, offset DavisEnergyBall5Left, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance6Left, dstX, dstY
invoke drd_imageDraw, offset DavisEnergyBall6Left, dstXX, dstYY
invoke drd_imageDraw, offset DavisEnergyBall7Left, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandLeft, dstX, dstY
invoke drd_imageDraw, offset DavisEnergyBall7Left, dstXX, dstYY
invoke drd_flip
mov[movementWalk], 0
jmp endSide




GotoRightEnergyBall :
add[PunchHand], 0
jp RightRightHandEnergy
invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance1Right, dstX, dstY

mov ebx, dstY
add ebx, 50
mov dstYY, ebx
mov ebx, dstX
add ebx, 20
mov dstXX, ebx
add dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall1Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance2Right, dstX, dstY
add dstXX, 10
invoke drd_imageDraw, offset DavisEnergyBall1Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance3Right, dstX, dstY
add dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall3Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance4Right, dstX, dstY
add dstXX, 35
invoke drd_imageDraw, offset DavisEnergyBall4Right, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance5Right, dstX, dstY
add dstXX, 25
invoke drd_imageDraw, offset DavisEnergyBall5Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance6Right, dstX, dstY
invoke drd_imageDraw, offset DavisEnergyBall6Right, dstXX, dstYY
invoke drd_imageDraw, offset DavisEnergyBall7Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandRight, dstX, dstY
invoke drd_imageDraw, offset DavisEnergyBall7Right, dstXX, dstYY
invoke drd_flip
mov[movementWalk], 0
jmp endSide


RightRightHandEnergy :

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance1Right, dstX, dstY

mov ebx, dstY
add ebx, 50
mov dstYY, ebx
mov ebx, dstX
add ebx, 20
mov dstXX, ebx
add dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall1Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance6Right, dstX, dstY
add dstXX, 10
invoke drd_imageDraw, offset DavisEnergyBall1Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance7Right, dstX, dstY
add dstXX, 20
invoke drd_imageDraw, offset DavisEnergyBall3Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance8Right, dstX, dstY
add dstXX, 35
invoke drd_imageDraw, offset DavisEnergyBall4Right, dstXX, dstYY

invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance9Right, dstX, dstY
add dstXX, 25
invoke drd_imageDraw, offset DavisEnergyBall5Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisEnergyBallStance10Right, dstX, dstY
invoke drd_imageDraw, offset DavisEnergyBall6Right, dstXX, dstYY
invoke drd_imageDraw, offset DavisEnergyBall7Right, dstXX, dstYY
invoke drd_flip
call Delay5

invoke drd_imageDraw, offset lionforestLF2, 0, 0
invoke drd_imageDraw, offset DavisStandRight, dstX, dstY
invoke drd_imageDraw, offset DavisEnergyBall7Right, dstXX, dstYY

invoke drd_flip
mov[movementWalk], 0
jmp endSide





RandomTool:
pusha
invoke GetSystemTime, addr STime
xor edx, edx
mov dx, STime.wMilliseconds; bl is the input to get random number
xor eax, eax;//we want random number that Davis cor Y is possible to draw to
mov al, dl
mul al;//stores the random in ax



mov [Random], al
popa
ret





RockRestart :
cmp dstRockX, 1600
je RockRestartedX
jmp RockMovement

RockRestartedX :
cmp dstRockY, 750
jae RockRestartedY
add dstRockY, 30; call RandomTool
add dstRockY, eax
mov dstRockX, 0
jmp RockRestart

RockRestartedY :
mov dstRockY, 500
jmp RockRestartedX

RockMovement :
call gameOver2
call RockGone
ikh :
inc rockSide
mov edx, 0
mov eax, [rockSide]
mov ecx, 400
div ecx

RockCheck1 :
cmp edx, 0
je Rocknum1

RockCheck2 :
cmp edx, 90
jae RockSide2
jmp RockCheck3
RockSide2 :
cmp edx, 190
jb Rocknum2

RockCheck3 :
cmp edx, 190
jae RockSide3
jmp RockCheck4
RockSide3 :
cmp edx, 290
jb Rocknum3

RockCheck4 :
cmp edx, 290
jae RockSide4
jmp RockCheck5
RockSide4 :
cmp edx, 390
jb Rocknum4



RockCheck5 :
jmp Rocknum5

Rocknum1 :
invoke drd_imageDraw, offset Rock1, dstRockX, dstRockY
inc dstRockX

invoke drd_flip
ret

Rocknum2 :
invoke drd_imageDraw, offset Rock2, dstRockX, dstRockY
inc dstRockX


invoke drd_flip
ret

Rocknum3 :
invoke drd_imageDraw, offset Rock3, dstRockX, dstRockY
inc dstRockX

invoke drd_flip
ret

Rocknum4 :
invoke drd_imageDraw, offset Rock4, dstRockX, dstRockY
inc dstRockX

invoke drd_flip
ret

Rocknum5 :
invoke drd_imageDraw, offset Rock5, dstRockX, dstRockY
inc dstRockX


invoke drd_flip
ret





DavisIdle:
mov NoKey, 0

jmp endSide

endSide :
call RockRestart
mov[EnergyBall], 0
mov[Punch], 0

invoke drd_flip
jmp joke


RockGone :
; if Rock + 150 less than EB jump
mov ebx, [dstRockX]
add ebx, 120
cmp ebx, dstXX
jb fgd

; if Man + 201 less than Rock jump
mov ebx, [dstXX]
add ebx, 175
cmp ebx, dstRockX
jb fgd


; if RockY + 120  less than EB jump
mov ebx, [dstRockY]
add ebx, 120
cmp ebx, dstYY
jb fgd

; if EB + 175 less than RockY jump
mov ebx, [dstYY]
add ebx, 175
cmp ebx, dstRockY
jb fgd

mov [dstRockX], 0
xor eax, eax
call RandomTool

mov al, Random
add al, Random
add ax,475


mov [dstRockY], eax

pusha
	mov edx,1600
	mov ebx,0
	mov [dstYY],0
	mov [dstXX],1600
popa

invoke drd_flip


fgd :
ret

joke :

jmp start


ret
main ENDP
end main