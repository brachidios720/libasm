global ft_list_sort

section .text

ft_list_sort:
    push rbx
    mov rbx, rsi            ; rbx = cmp
    cmp qword [rdi], 0
    jz .done                ; liste vide
    mov r12, rdi            ; r12 = &head

.outer:
    xor r11, r11            ; swap flag = 0
    mov r8, [r12]           ; r8 = head
.inner:
    mov r9, [r8 + 8]        ; r9 = next
    cmp r9, 0
    jz .check               ; fin de liste

    push r8
    push r9
    mov rdi, [r8]           ; data1
    mov rsi, [r9]           ; data2
    call rbx                ; cmp(data1, data2)
    pop r9
    pop r8

    test eax, eax ; obliger d utiliser eax et pas rax car valeur attendue 32 bit = int
    jle .no_swap

    ; swap des data
    mov r10, [r8]
    mov rax, [r9]
    mov [r8], rax
    mov [r9], r10
    mov r11, 1

.no_swap:
    mov r8, r9
    jmp .inner

.check:
    test r11, r11
    jnz .outer
    jmp .done

.done:
    pop rbx
    ret
