	ORG 100H

;----------------------------------------

; PRAKTIKUM 2:
; Grundlegende Befehle

start:
		mov al,01010101b
		mov ah,0aah
		mov cx,ax

		mov [0150h],al
		mov [0152h],cx

		add ch,cl

		mov bx,2
		dec bx
		dec bx
		dec bx

		mov dx,7700h
		not bh
		or  dl,bl
		and dh,11001100b

		mov al,00000110b
		mov cx,3
schl:	rol al,1
		out 0,al
		loop schl
       
		mov bl,00000110b
		mov cl,3
		shr bl,cl

		mov al,-1
		out 90h,al
		not al
		out 92h,al
		out 94h,al
       
		jmp start


;----------------------------------------
