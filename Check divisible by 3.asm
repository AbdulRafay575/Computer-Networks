.model small
.stack 100h
.data
msg1 db "Enter the Range To Check which number is divisible by 3: $"
start db 0
end db 0
msg3 db "  $"
msg2 db 0ah, 0dh, "The Numbers are : $"
num db 3
.code
mov ax, @data
mov ds, ax
;display input message
mov ah, 09h
lea dx, msg1
int 21h
;Taking first input
mov ah,1
int 21h 
sub al,48
mov start,al
;print tab space
mov dx,offset msg3
mov ah,09h
int 21h 
;Taking second input
mov ah,1
int 21h 
sub al,48
mov end,al 
;mov end,10
mov dx,offset msg2
mov ah,09h
int 21h
;Setting start and end values
mov cx,0
mov cl,end
mov bl,start
cmp bl,end
JG done 
;For looping Type Effect
again: 
;divide and check part
mov ah,0
mov al,bl
div num
cmp ah,0
je print
there:
;Increment bl and check bl if equal to end range
inc bl 
cmp bl,end
je done
jmp again 
;To Terminate Program
done: 
mov ah, 4ch
int 21h
;printing function to print number that divide by 3
print proc 
mov dl,bl
add dl,48
mov ah,2
int 21h
jmp there    
endp print

end