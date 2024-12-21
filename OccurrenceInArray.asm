.model small
.stack 100h
.data
    array db 9 dup (?) 
    len db 0
    msj1 db 'Enter array length between 1 and 9',10,13,'$'
    msj2 db 10,13,'Enter elements',10,13,'$'
    msj3 db 10,13,'The elements of the array are',10,13,'$'
    msj4 db 10,13,'Enter the element you want to find the occurrence of',10,'$'
    msj5 db 10,13,'Occurence',10,13,'$'
    occurrence db 0

.code
start:
    mov ax,@data
    mov ds,ax
    mesaj MACRO msj
        mov ah,09h
        lea dx,msj
        int 21h
    ENDM
    mesaj msj1
    mov ah,01h
    int 21h
    sub al,48
    mov len,al 
    xor cx,cx
    mov cl,len
    lea di,array
    mesaj msj2
    read_elements:
        mov ah,01h
        int 21h
        sub al,48
        mov [di],al
        inc di 
        ;carriage return
        mov ah,02h
        mov dl,13
        int 21h
        mov dl,10
        int 21h
    loop read_elements
    xor cx,cx 
    mov cl,len
    lea si,array
    mesaj msj3
    display_elements:
        mov al,[si]
        add al,48
        mov dl,al
        mov ah,02h
        int 21h
        inc si
        ;carriage return
        mov ah,02h
        mov dl,13
        int 21h
        mov dl,10
        int 21h
    loop display_elements
    mesaj msj4
    mov ah,01h
    int 21h
    sub al,48
    mov bl,al
    xor cx,cx
    mov cl,len
    lea si,[array]
    xor dx,dx
    count_occurrence:
        cmp [si],bl
        jne next_element
        inc occurrence
    next_element:inc si
    loop count_occurrence 
    mesaj msj5
    add occurrence,48
    mov ah,02h
    mov dl,occurrence
    int 21h
    mov ah,4ch
    int 21h
end start

    