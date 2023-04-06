;15,14,13,9,8,7,6,4,2,0 (sayilar decimaldir)dizisindeki sayilari 
;herhangi bir sÄ±ralama algoritmasÄ±nÄ± kullanarak siralayiniz. 

name "snt" 
org  256    
jmp  start
    
arr  db 0, 2, 4, 6, 7, 8 ,9, 13, 14, 15 
count  dw 10 

start:  
mov cx,count       
mov di, 0h ; starter memory  
mov bp, 200h                   

memory:               ;assign arr to memory
    mov ah, arr+di           
    mov [bp][di], ah
    add di, 1h
    loop memory  
    
mov si,0h ;0.index         
mov ax, 0 
mov cx,10    

nextscan:                      ; do {    // outer loop
    mov bx,cx
    mov si,0 
    
nextcomp:
    mov al,[bp][si]   
    inc si
    mov dl,[bp][si]
    cmp al,dl
    jnc noswap 
    mov [bp][si],al 
    dec si
    mov [bp][si],dl  
    
noswap: 
    inc si
    dec bx
    jnz nextcomp
    loop nextscan       ; } while(--cx);

ret 
