section .data
    printf_format db "%d", 10, 0
    integer1: times 4 db 0
    scanf_format db "%d", 0

section .bss

section .text
    extern printf
    extern scanf
    global main

main:
    push integer1 
    push scanf_format
    call scanf
    add esp, 8 

    mov ebx, [integer1]
    
    call fatorial

    push eax

    push printf_format
    call printf
    add esp, 8
    
    ret

fatorial:
    cmp     ebx, 1    
    jnbe    L1                      
    mov     eax, 1                  
    ret

L1:
    push    ebx                     
    dec     ebx                     
    call    fatorial               
    pop     ebx                     
    imul    eax, ebx                
    ret