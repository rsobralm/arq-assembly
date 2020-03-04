extern printf

global main

section .data
    printf_format db "fatorial: %d", 10, 0

section .text
main:
    mov rbx, 4
    call factorial

    mov rdi, printf_format
    mov rsi, rax
    mov rax, 0
    call printf
    mov rax, 0

    ret

factorial:
    cmp     rbx, 1                  ; n <= 1?
    jnbe    L1                      ; if not, go do a recursive call
    mov     rax, 1                  ; otherwise return 1
    ret

L1:
    push    rbx                     ; save n on stack (also aligns %rsp!)
    dec     rbx                     ; n-1
    call    factorial               ; factorial(n-1), result goes in %rax
    pop     rbx                     ; restore n
    imul    rax, rbx                ; n * factorial(n-1), stored in %rax
    ret
