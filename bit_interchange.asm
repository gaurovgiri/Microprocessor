LXI H,2000H
LXI D,4000H
MVI C,1

LOOP:
MOV A,M
ANI 12H ; masking

CPI 00H
JZ NO_OP

CPI 12H
JZ NO_OP


MOV A,M 
XRI 12H

JMP COPY


NO_OP:
	MOV A,M
	JMP COPY

COPY:
	STAX D
	INX H
	INX D
	DCR C
	JNZ LOOP
	HLT





#org 2000
#db A6
