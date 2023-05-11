org 100h

.data
    ilksayi db 0ah,0dh, "Ilk sayiyi girin:  $"                                                     
    ikincisayi db 0ah,0dh, "Ikinci sayiyi girin: $"
                                                          
    islemsec db 0ah,0dh, "Yapacaginiz islem:$"
    secenek db 0ah, 0dh, "Toplam=t, Cikarma=c, Bolme=b, Carpma=p $"
    
    sonuc db 0ah,0dh, "Islemin Sonucu : $" 
    
    cont db 0ah,0dh, "Devam etmek icin d cikmak icin q ya basiniz $" 
    
    hatamesaji db 0ah,0dh, "hatali islem yaptiniz $"  
      
    birinci db 00h
    ikinci db 00h    
	islem db 00h

.code 

islemal:
          
    lea dx,islemsec        
    mov ah,09h                ;islem secimi
    int 21h
                             
    lea dx,secenek         
    mov ah,09h           
    int 21h
                
    mov ah,01h                ;islemi al      
    int 21h

	mov [islem], al
	
birincisayial:
         
    lea dx, ilksayi      
    mov ah,09h               
    int 21h

    mov ah,01h                ;ilk sayiyi al  
    int 21h

	mov [birinci], al

ikincisayial: 
        
    lea dx, ikincisayi      
    mov ah,09h               
    int 21h

    mov ah,01h                ;ikinci sayiyi al  
    int 21h

	mov [ikinci], al

mov al, [islem]

cmp al,'t'           
jz toplama 

cmp al,'c'           
jz cikarma

cmp al,'b'           
jz bolme

cmp al,'p'           
jz carpma   

         

toplama:
	lea dx, sonuc 
	mov ah,09h               
    int 21h    
    
    mov al, [birinci]   
	sub al , 30h
	mov bl, [ikinci] 
	sub bl, 30h
	add al, bl 
	add al, 30h

	mov ah, 0eh
	int 10h
	jmp devam  
	
cikarma:
	lea dx, sonuc 
	mov ah,09h               
    int 21h    
    
    mov al, [birinci]   
	sub al , 30h
	mov bl, [ikinci] 
	sub bl, 30h
	sub al, bl 
	add al, 30h
    
    
	mov ah, 0eh
	int 10h
	jmp devam 

bolme:
	lea dx, sonuc 
	mov ah,09h               
    int 21h    
    
    mov ah, 0h
    mov al, [birinci]   
	sub al , 30h
	mov bl, [ikinci] 
	sub bl, 30h
	div bl
	add al, 30h

	mov ah, 0eh
	int 10h
	jmp devam 	

carpma:
	lea dx, sonuc 
	mov ah,09h               
    int 21h    
    
    mov al, [birinci]   
	sub al , 30h
	mov bl, [ikinci] 
	sub bl, 30h
	mul bl
	add al, 30h

	mov ah, 0eh
	int 10h 
	jmp devam

devam:
   lea dx, cont      
   mov ah,09h               
   int 21h 
   mov ah,01h                ;devam or quit  
   int 21h    
   
   cmp al,'d'           
   jz islemal 

   cmp al,'q'           
   hlt 