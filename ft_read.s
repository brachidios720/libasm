global ft_read

section .text

ft_read:

        mov rax, 0          ; syscall number for sys_read
        syscall              ; fd = rdi (0 for stdin), buf = rsi, count = rdx
        ret                 ; return from function