	   LXI H,2000
	   LXI D,8090
	   MVI C,02

LOOP:	   MOV A,M
	   CPI 0F
	   JC START
	   JMP NEXT

START:	   MOV B,A
	   MVI A,00

SQUARE:	   ADD M
	   DCR B
	   JNZ SQUARE
	   JMP COPY

COPY:	   STAX D
	   INX D
	   DCR C
	   JNZ NEXT
	   HLT

NEXT:	   INX H
	   JNZ LOOP
	   HLT
# ORG 2000
# DB 02,FF,03