global ft_list_push_front

extern ft_lst_new
section .text

ft_list_push_front:

    push rbx 
    push rbp
    mov rbx, rdi ; permet de sauvegarder des valuer dans des registre en locurence la **beginlist
    mov rbp, rsi ; ici data
    mov rdi, rsi ; on met la valuer de data dans rdi pour le malloc la bonne taille 
    
    call ft_lst_new 
    test rax, rax ; test du malloc 
    jz .return

    mov rcx, [rbx] ; mise a jour des valuer
    mov [rax + 8], rcx ; swap des maillont ici rcx debien la tete donc la tete + next  == l ancien premier 
    mov [rbx], rax ; ici le nouveau deviens le premier

.return:

    pop rbp
    pop rbx
    ret

