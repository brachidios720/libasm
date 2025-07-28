global ft_write

section .text

ft_write:

        mov rax, 1          ; syscall number for sys_write
        syscall              ; fd = rdi (1 for stdout), buf = rsi, count = rdx
        ret                 ; return from function