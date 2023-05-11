org 100h  

.data
 
    s_size equ 6   
    
    yilan dw s_size dup(0)
    kuyruk dw ?     
    
    sol equ 4bh
    sag equ 4dh
    yukari equ 48h
    asagi equ 50h 
    
    sayac  dw 0   
    
    cur_dir db sag
    bekle dw 0     

.code 

mov dh,2d
mov dl,6d
mov ah,02h
int 10h     
mov ah,09h  

mov al,'m'
mov cx,1
mov dh,2d               ;m nin koordinati
mov dl,6d
mov bl,0Ah
mov bh,00
int 10h      

mov dh,3d
mov dl,15d
mov ah,02h
int 10h      
mov ah,09h
mov al,'i'              ;i nin koordinati
mov cx,1
mov dh,2d
mov dl,6d
mov bl,09h
mov bh,00
int 10h       

mov dh,5d
mov dl,2d               
mov ah,02h
int 10h       

mov ah,09h
mov al,'c'
mov cx,1
mov dh,2d                ;c nin koordinati
mov dl,6d
mov bl,04h
mov bh,00       
int 10h           

mov dh,8d
mov dl,16d
mov ah,02h
int 10h            

mov ah,09h
mov al,'r'
mov cx,1
mov dh,2d
mov dl,6d
mov bl,0Fh               ;r nin koordinati
mov bh,00
int 10h           

mov dh,7d
mov dl,18d
mov ah,02h
int 10h             

mov ah,09h
mov al,'o'
mov cx,1
mov dh,2d                ;o nin koordinati
mov dl,6d
mov bl,06h
mov bh,00
int 10h              

mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h  

         
loopy: 

    mov al, 0  
    mov ah, 05h
    int 10h
    mov dx, yilan[0]
    mov ah, 02h
    int 10h     
    
    mov al, '*'
    mov ah, 09h                  ;* basar yilan boyutunca
    mov bl, 0eh
    mov cx, 1
    int 10h
    mov ax, yilan[s_size * 2 - 2]
    mov kuyruk, ax
    call move_yilan  
    
    mov dx, kuyruk
    mov ah, 02h
    int 10h      
    
    mov al, ' '
    mov ah, 09h                  ;ilerlemede arkayi bosaltir
    mov bl, 0eh 
    mov cx, 1   
    int 10h    

cikiskontrol:

    mov ah, 01h
    int 16h
    jz nokey
    mov ah, 00h            
    int 16h
    cmp al, 13                 ;enter ise programi bitir
    je durdur  
    mov cur_dir, ah    
    
nokey: 

    mov ah, 00h
    int 1ah
    cmp dx, bekle
    jb cikiskontrol
    add dx, 4
    mov bekle, dx
    jmp loopy      

durdur:  

    mov ah, 1
    mov ch, 0bh
    mov cl, 0bh
    int 10h
    ret          

move_yilan proc near   
    
mov ax, 40h
mov es, ax
mov di, s_size * 2 - 2
mov cx, s_size-1     
  
move_array:
  mov ax, yilan[di-2]
  mov yilan[di], ax
  sub di, 2
  loop move_array
  mov di,sayac
  inc di
  mov sayac,di    
  
  cmp di,3
  jb move_asagi    
  
  cmp di,9
  jb move_sag   
  
  cmp di,10
  jb move_asagi    
  
  cmp di,19
  jb move_sag   
  
  cmp di,21
  jb move_asagi   
  
  cmp di,34
  jb move_sol  
                            ;koordinatlara gore ilerleme
  cmp di,37  
  jb move_asagi  
  
  cmp di,51
  jb move_sag  
   
  cmp di,53
  jb move_sag
  
  cmp di,59
  jb move_yukari                ;90 derece bir kere daha dondu
  
  cmp di,65
  jb move_sol 
  
jmp dur  
 
move_sag: 

  mov al, b.yilan[0]
  inc al
  mov b.yilan[0], al
  cmp al, es:[4ah]     
  jb dur
  mov b.yilan[0], 0   
  jmp dur
    
move_sol:    

  mov al, b.yilan[0]
  dec al
  mov b.yilan[0], al
  cmp al, -1
  jne dur       
  mov al, es:[4ah]    
  dec al
  mov b.yilan[0], al  
  jmp dur

move_yukari:   

  mov al, b.yilan[1]                      ;hareketler
  dec al
  mov b.yilan[1], al
  cmp al, -1
  jne dur
  mov al, es:[84h]    
  mov b.yilan[1], al  
  jmp dur

move_asagi: 

  mov al, b.yilan[1]
  inc al
  mov b.yilan[1], al
  cmp al, es:[84h]    
  jbe dur
  mov b.yilan[1], 0   
  jmp dur

dur:
    ret   
  
move_yilan endp