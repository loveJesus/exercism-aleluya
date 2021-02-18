; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.
section .text
;extern void rotate(const char *text_aleluya, int shift_key_aleluya, char *buffer_aleluya);
global rotate
rotate:
    movzx ecx, byte [rdi]
    inc rdi    
    test cl, cl
    je _rotate_isdone_aleluya
    mov eax, ecx
    and al, 0b1101_1111
    sub al, 65
    cmp al, 26
    jae _rotate_not_letter_aleluya
    add eax, esi
    cmp al, 26
    jnae _rotate_not_ovf_aleluya
    sub al, 26

_rotate_not_ovf_aleluya:
    test cl, 0b0010_0000
    je _rotate_is_upper_aleluya
    add al, 97
    mov [rdx], al
    inc rdx
    jmp rotate

_rotate_is_upper_aleluya:
    add al, 65
    mov [rdx], al
    inc rdx
    jmp rotate

_rotate_not_letter_aleluya:
    mov [rdx], cl
    inc rdx
    jmp rotate

_rotate_isdone_aleluya:
    mov [rdx], cl
    ret
