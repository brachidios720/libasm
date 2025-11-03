global ft_list_remove_if
extern free

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

    mov r9, [rbx] ; mettre le debut de la liste dans r9
    test r9, r9 ; si vide return
    jz .end

    mov rdi, [r9] ; remettre dans rdi 
    mov rsi, rbp ; remetre dans rsi pour l appele a fonction
    call r12 ; appele de la fonction 
    test eax, eax ; test du resultat pour savoir si il faut del au cas ou ce st egale
    je .del ; je condition de jump si le resultat de la derniere comparaison est egale 
    lea rbx, [r9 + 8] ; permet d'avance dans le noeud en avancant directemenet a l adresse
    jmp .loop  

.del:

    mov r10, [r9 + 8] ;save le noeud suivant 
    mov rdi, [r9] ; remettre a jout rdi avant l appel a fonction 
    call r13 ; appelle de fonction 
    mov rdi, r9 ; mettre a jour rdi avant appelle a fonction 
    call free wrt ..plt ; apelle de freee
    mov [rbx], r10 ; mettre a jour le poiteur de la liste *current = next
    jmp .loop

.end:

    pop r13
    pop r12
    pop rbp
    pop rbx
    ret