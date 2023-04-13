org 100h

.model small 
.stack 64 
.DATA 
.CODE   

screen macro 
    mov ah,00 
    mov al,13h 
    int 10h 
endm  

clear_screen macro ;ekrani temizliyoruz 
    mov ax,600h 
    mov bh,07h 
    mov cx,0 ;baslangic koordinatlari 
    mov bx,184fh ;bitis koordinatlari 
    int 10h 
endm 
    
kirmizi macro x,y ;kirmizi cizgiler
     
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: 
    mov ah,0ch
    mov al,04 ;04 red 
    int 10h 
    inc cx 
    cmp cx,150 
    jnz myloop 
endm     

mavi macro x,y ;mavi cizgiler  
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,01 ;01 blue 
    int 10h 
    inc dx 
    cmp dx,151 ;151 cunku 150 olunca bosluk kaliyor
    jnz myloop 
endm 

solturuncu macro x,y ;capraz sol turuncu
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,06 ;06 brown 
    int 10h
    inc dx 
    inc cx
    cmp cx,81 
    jnz myloop
endm 

sagturuncu macro x,y ;capraz sag turuncu
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,06 ;06 brown 
    int 10h
    dec dx 
    inc cx
    cmp cx,150 
    jnz myloop
endm 

solmage macro x,y ;capraz sol mage
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,0dh ;D 1101 light magenta 
    int 10h
    inc dx 
    dec cx
    cmp cx,10 
    jnz myloop
endm 

sagmage macro x,y ;capraz sag mage
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,0dh ;D 1101 light magenta 
    int 10h
    dec dx 
    dec cx
    cmp cx,80 
    jnz myloop
endm 

sagayatiku macro x,y ;capraz saga ust ucgendeki yatik yesiller
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,02 ;02 yesil
    int 10h
    dec dx 
    inc cx
    cmp dx,10 
    jnz myloop
endm  

sagayatika macro x,y ;capraz saga alt ucgendeki yatik yesiller
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,02 ;02 yesil
    int 10h
    dec dx 
    inc cx
    cmp cx,150 
    jnz myloop
endm  

solayatika macro x,y ;capraz sol alt ucgendeki yatik yesiller
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,02 ;02 yesil
    int 10h
    dec dx 
    dec cx
    cmp cx,10 
    jnz myloop
endm 

solayatiku macro x,y ;capraz sol ust ucgendeki yatik yesiller
    
    local myloop 
    mov cx,x ;sutun 
    mov dx,y ;satir. 
    mov bh,0h 
    
    myloop: mov ah,0ch
    mov al,02 ;02 yesil
    int 10h
    inc dx 
    inc cx
    cmp cx,150 
    jnz myloop
endm 

    clear_screen  
    screen 
    
    solturuncu 10,10  ;sol turuncu kosegen
    
    sagmage 150,150     ;sag magenta kosegen
    
    solayatiku 30, 10
    solayatiku 50, 10
    solayatiku 70, 10
    solayatiku 90, 10
    solayatiku 110, 10
    solayatiku 130, 10
    
    solayatika 30,150
    solayatika 50,150
    solayatika 70,150
    solayatika 90,150
    solayatika 110,150
    solayatika 130,150


    sagayatika 30, 150 
    sagayatika 50, 150 
    sagayatika 70, 150 
    sagayatika 90, 150 
    sagayatika 110, 150
    sagayatika 130, 150   

    sagayatiku 10, 30 
    sagayatiku 10, 50
    sagayatiku 10, 70
    sagayatiku 10, 90
    sagayatiku 10, 110
    sagayatiku 10, 130
    ;zaten mag ve turuncu olanlari tekrar yazdirmiyoruz
    
    sagturuncu 80,80  ;sag turuncu kosegen
    
    solmage 80,80       ;sol magenta kosegen 
    
    
    kirmizi 10,10 ;kirmizi ust 
    kirmizi 10,80  ;kirmizi orta
    kirmizi 10,150 ; kirmizi alt
                                       
    mavi 10,10   ;mavi sol
    mavi 80,10   ;mavi orta
    mavi 150,10   ;mavi sag  
    
ret


