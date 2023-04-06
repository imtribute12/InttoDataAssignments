;Assign the numbers 20h, 50o, 226, 01011100b to memory, starting at address 400h:50h, with no spaces between them (it is important to consider the space the 
;numbers take up in memory). First, recall the first and third numbers and add them, then recall the other two numbers and subtract their sum from the first total. 
;Assign the result to address 400h:70h.

name "seda taskan - lab 1"

mov ax, 400h 
mov ds, ax   

sub ax, ax ;clearing

mov [50h], 20h
mov [51h], 50o
mov [52h], 226 
mov [53h], 01011100b

mov al, [50h] 
mov bl, [51h]  ;assigning variables
mov cl, [52h]
mov dl, [53h]   

add ax, cx        
add bx, dx ;add

sub ax, bx ;sub 
                   
mov [70h], ax ;assigning result to 400h:70h

ret
