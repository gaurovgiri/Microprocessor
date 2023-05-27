.model small
.data             
    src1 db 01h,02h,03h,04h,05h,06h,07h,08h,09h
    src2 db 11h,12h,13h,14h,15h,16h,17h,18h,19h
.code
    MOV AX,@data
    MOV DS,AX
    MOV SI,OFFSET src1
    MOV DI,OFFSET src2
    MOV CX,0AH
back:
    MOV AL,[SI]
    MOV BL,[DI]
    MOV [DI],AL
    MOV [SI],BL
    INC SI
    INC DI
    DEC CL
    JNZ back
    MOV AH,4CH
    INT 21H
    END
    
    