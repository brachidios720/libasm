global  ft_strdup

externe ft_strlen
externe malloc
externe ft_strcpy

section .text


ft_strdup:

    test rdi, rdi
    je     .null_source  ; check if source is NULL

    push  rdi             ; save source string pointer
    call   ft_strlen      ; get the length of the source string
    inc rax              ; increment length for null terminator
    mov rdi, rax         ; move length to rdi for allocation
    call   malloc         ; allocate memory for the new string
    
    test rax, rax
    je     .malloc_faile   ; check if allocation was successful
    
    pop rsi
    
    mov rdi, rax         ; move allocated memory address to rdi
    call   ft_strcpy      ; copy the source string to the allocated memory
    ret

.malloc_faile:
    add rsp, 8          ; clean up stack
.null_source:
    xor rax, rax          ; return NULL if source is NULL
    ret
