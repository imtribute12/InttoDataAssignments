;mov ax,200h
;mov ds,ax
sub ax,ax
mov bl,1
mov bh,1
mov ch,1  
mov dl,0    
mov dh,2
fibo:  
    add bl,bh 
    mov cl,bl
    mov bl,bh
    mov bh,cl  
    mov ah,0
    mov al,cl
    div dh
    cmp ah,1
    je topla
    cmp cl,15h
    jne fibo  
    je exit
topla:
    add dl,cl 
    
    cmp cl,15h
    jne fibo  
    je exit 

exit:   
    add dl,2
    mov dh,0
ret
