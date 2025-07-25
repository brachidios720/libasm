global ft_strcmp

section .text

ft_strcmp: 
    xor     rax, rax        ; rax = 0
    xor     rcx, rcx        ; rcx resulat 

.loop: 
    mov     al, BYTE [rdi + rcx] ; charge le caractère de la première chaîne
    mov     dl, BYTE [rsi + rcx] ; charge le caractère de la    

    cmp     al, dl          ; compare les caractères
    jne     .diff ; si différents, saute à .diff

    cmp     al, 0          ; vérifie si le caractère est le terminator null
    je      .equal           ; si oui, saute à .end

    inc     rcx             ; incrémente l'index
    jmp     .loop           ; continue la boucle


.diff:
    movzx   eax, al     ; convertit le caractère de la première chaîne en entier non signé
    movzx   edx, dl     ; convertit le caractère de la seconde chaîne en entier non signé
    sub     eax, edx   ; soustrait les deux caractères
    ret 

.equal:
    xor     eax, eax     ; si les chaînes sont égales, retourne 0
    ret