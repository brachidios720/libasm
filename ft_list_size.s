global ft_list_size

section .text

ft_list_size:

    cmp rdi, 0 ; check si lst null
    jz .return
    xor rax, rax ; met rax(inc) a 0

.loop:

    inc rax ; incremente rax 
    cmp qword [rdi + 8], 0 ; cmp le noeud suivant avec null 
    je .return
    mov rdi, qword [rdi + 8] ; avance au noeud suivant 
    jmp .loop ; recommence 

.return:
    ret ; resultat de l incrementation 
