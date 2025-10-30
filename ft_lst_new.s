global ft_lst_new

extern malloc
section .text

ft_lst_new:

        push rbx
        mov rbx, rdi ; sauvegrder data
        mov rdi, 16 ; mettre a jour la valeur de 2 pointeur pour le malloc (taille de t_list)
        call malloc wrt ..plt
        test rax, rax
        jz .return

        mov [rax], rbx ; rentrer le data saved dans rbx 
        mov qword [rax + 8], 0 ; mettre le pointeru next a null

.return:

        pop rbx
        ret