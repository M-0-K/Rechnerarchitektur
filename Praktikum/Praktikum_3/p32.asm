        org 100h

start:  mov al,1

left:   loop left
        out 0,al
        shl al,1
        test al,7fh
        jnz left

right:  loop right
        out 0,al
        shr al,1
        test al,11111110b
        jnz right
        jmp left