global ft_strcpy

section .text

ft_strcpy:
    xor     rcx, rcx        ; rax = 0
    xor     rdx, rdx      ; rdx = tmp = 0
    cmp     rsi , 0 ; check if source is NULL
    jz      return  ; if NULL, return NULL
    jmp     copy   ; aller a copy

increment:
    inc     rcx
    
copy: 
    mov     dl, [rsi + rcx] ; copy byte from source to destination
    mov     [rdi + rcx], dl ; store byte in destination
    cmp     dl, 0 ; check if byte is null terminator
    cmp     dl, 0 ; if not, continue copying
    jnz     increment ; continue copying
return:
    mov     rax, rdi ; return destination pointer
    ret