global ft_list_remove_if

section .text


ft_list_remove_if:

    push rbx
    push rbp
    push r12
    push r13

    ;save les argument de la fonciton dont les fonction elles meme pour pouvoir les appeler 
    mov rbx, rdi ;begin_list
    mov rbp, rsi ;data_ ref
    mov r12, rdx ; cmp fct
    mov r13, rcx ;free_fct

.loop:

    push r9
    mov r9, [rbx]
    test r9, r9
    jz .end

    mov rdi, [r9]
    mov rsi, rbp
    call r12
    test rax, rax
    je .del
    mov r14, r9;
    mov r14, [r14 + 8]
    pop r9
    lea rbx, [r9 + 8]


    mov  

.del:


.end:

    pop r13
    pop r12
    pop rbp
    pop rbx
    ret