.model small

.stack 100H

.data
    ten dw 10
    cret dw 13

.code 
    main proc
       mov ax, @data
       mov ds, ax
       
       mov ah, 01H
       int 21h 
       
       sub al, 30H
       cmp al, 09H
       jle factorial
       jmp stop

    factorial:
        mov cl, al
        dec cl 
        start:
            mul cl
            dec cl
            cmp cl, 01H
            je done
            jmp start
    
        done:
            mov cx,0000H
            convert:
                mov dx, 0000H
                div ten
                inc cx
                add dx, 30H
                push dx    
                cmp ax, 00H
                je display1
                jmp convert 
        
        display1:
            mov dx, cret
            mov ah,02H
            int 21H
        display:
            pop dx
            mov ah, 02H
            int 21H
            loop display

        stop:
            mov ax, 4CH
            int 21H
        main endp
    end main