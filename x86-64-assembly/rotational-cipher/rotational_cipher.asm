; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.
section .text
;extern void rotate(const char *text_aleluya, int shift_key_aleluya, char *buffer_aleluya);
global rotate
rotate:
    mov r8, rbx
rotate_inner_aleluya:
    movzx ecx, byte [rdi]
    inc rdi    
    test cl, cl
    je _rotate_isdone_aleluya
    mov ebx, ecx    
    bts ebx, 5
    lahf    
    sub bl, 97
    cmp bl, 26
    jae _rotate_not_letter_aleluya
    add ebx, esi
    cmp bl, 26
    jnae _rotate_not_ovf_aleluya
    sub bl, 26

_rotate_not_ovf_aleluya:
    and ah, 0b1 ;from lahf aleluya
    shl ah, 5    
    add bl, 65
    add bl, ah
    mov [rdx], bl
    inc rdx
    jmp rotate_inner_aleluya

_rotate_not_letter_aleluya:
    mov [rdx], cl
    inc rdx
    jmp rotate_inner_aleluya

_rotate_isdone_aleluya:
    mov [rdx], cl
    mov rbx, r8
    ret
