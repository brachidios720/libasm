global ft_strlen  ; rend accessible de puis l exterieur pour compiler

section .text

ft_strlen:
    xor     rax, rax        ; rax = 0
.loop:
    cmp     byte [rdi + rax], 0
    je      .end
    inc     rax
    jmp     .loop
.end:
    ret
