global ft_atoi_base

section .text

ft_atoi_base:


        push rbx
        push rbp

        mov rbx, rdi
        mov rbp, rsi
        ; check si string NULL
        cmp rbx, 0
        jz .end
        cmp rbp, 0
        jz .end

        xor rcx, rcx; mise en place du compteur 
        mov r8, rbp; sauvegarde de base 
        mov r9, r8
        mov r10, rbx

.loop_check_base:

        mov al, byte [r8]
        test al, al
        jz .end_check_loop
        cmp al, '-'
        je .end
        cmp al, '+'
        je .end 
        cmp al, ' '
        je .end
        cmp al, '\n'
        je .end
        cmp al, '\t'
        je .end
        inc r8
        inc rcx
        jmp .loop_check

    ; loop de check de doublon avce un [j]

.extern_loop_doublon_check:

        mov al, byte [r8]
        test al, al
        jz .reset_rcx

        inc r9

.intern_loop_doublon_check:

        mov bl, byte [r9]
        test bl, bl
        jz .next_char

        cmp al, bl ; si doublon passer a ret 
        je .end
        inc r9 ; inc le petit j
        jmp .intern_loop_doublon_check


.next_char:

        inc r8 ; passer au caractere suivant 
        jmp .extern_loop_doublon_check


.end_check_loop:

        cmp rcx, 2
        jb .end
        mov r8, rbp; remettre le poutneur a 0 avant le check de doublon
        jmp .extern_loop_doublon_check

.reset_rcx

        xor rcx, rcx
        jmp .str_check

.str_check:

        mov al, byte [r10]

        cmp al, 
        ;test de toute les valeur comme espace et tab
        cmp al, 9
        je .incrementation_condition
        cmp al, 10
        je .incrementation_condition
        cmp al, 11
        je .incrementation_condition
        cmp al, 12
        je .incrementation_condition
        cmp al, 13
        je .incrementation_condition
        cmp al, 32
        je .incrementation_condition
        cmp al, '-'
        je .incrementation_sign_condition
        cmp al, '+'
        je .incrementation_condition

        jmp .str_check

.incrementation_sign_condition:

        inc rcx ; flag qui sera paire ou impaire pour le signe 
        inc r10
        jmp .str_check

.incrementation_condition:

        inc r10
        jmp .str_check


.atoi:
        


.end:

        pop rbx
        pop rbp
    ret