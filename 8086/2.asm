.model small
.stack 100H

.data
    ten dw 10

.code

main proc far
    mov ax, @data
    mov ds, ax

    mov ax,02H
    mov dx,04H
    mov cx,63H

    sum:
        add ax,dx
        add dx,02H
        loop sum
    
    convert:
        mov dx, 0000H
        div ten ; remainder dx->AX/ten
        inc cx; digit counter
        add dx, 30H ; corresponding ascii
        push dx
        cmp ax, 00h
        je display
        jmp convert
    
    display:
        pop dx
        mov ah, 02H
        int 21H
        loop display

        mov ax, 4ch
        int 21h
    main endp
end main 


    


    