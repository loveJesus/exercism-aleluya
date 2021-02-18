; ללויה
section .text
; Ascii 65<=upper<=90 97<=lower<=122 
;extern int is_isogram(const char *str_aleluya);
global is_isogram
is_isogram:
    xor edx, edx ;hit buffer aleluya    
_is_isogram_loopleluya:
    movzx ecx, byte [rdi]
    test cl, cl
    je _is_isogram_eos_aleluya
    inc rdi
    and cl, 0b1101_1111 ;Make uppercase aleluya
    sub cl, 65    
    cmp cl, 26
    ja _is_isogram_loopleluya    
    bts edx, ecx
    jnc _is_isogram_loopleluya
    xor rax, rax ; not isogram
    ret

_is_isogram_eos_aleluya:
    mov rax, 1
    ret

; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.
