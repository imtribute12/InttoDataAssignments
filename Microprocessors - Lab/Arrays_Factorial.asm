;Assign 10 random numbers between 0-255 to the memory. (eg: 6,4,15,23,54,32,12,34,5,7).
;Write the program that writes the factorial of the remainder from the smallest part of the 
;largest of these numbers to the ax register.
 
name "snt" 
org  256
jmp  start
 
arr db 16,8,15,20,65,3,12,34,5,7    
  
start:
mov cx,10      
mov di, 0h ; starter memory  
mov bp, 200h 
 
mov [100h], 2
             
memory:               ;assign arr to memory
    mov ah, arr+di           
    mov [bp][di], ah
    add di, 1h
    loop memory  
    
mov si,0h ;0.index         
mov ax, 0 
mov cx,10    
                       
isBig: 
  inc si  
  cmp [bp][si] , al  
  jnle bigger   
  loop isBig   
 
mov si,0h ;0.index 
mov bl, [bp][si]         
mov cx,9
isSma: 
  inc si  
  cmp [bp][si] , bl 
  jnge smaller   
  loop isSma  
                   
jmp done
                 
bigger:
  mov al, [bp][si] ;biggest
  loop isBig        

smaller:
  mov bl, [bp][si] ;smallest 
  loop isSma        
  
done: 
  div bl ;en buyugu ah. al / bl ise ah bolumden kalandir.
  mov cl, ah 
  mov ax, 1            ; 65 maks 3 min 65/3 = 21 + 2
  jmp fact


fact:    
    mul cl               ; 2! = 2*1        
    loop fact 
   
hlt
