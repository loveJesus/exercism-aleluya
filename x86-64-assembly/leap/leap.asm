;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.

section .text
global leap_year

; rdi - year_aleluya
; ret rax - bool is leap
leap_year:
    test rdi, 3
    jnz retfalse_aleluya

    mov edx, 0
    mov rax, rdi
    mov ecx, 100
    div ecx
    cmp edx, 0
    jne rettrue_aleluya

    mov ecx, 400
    mov rax, rdi
    div ecx
    cmp edx, 0
    je rettrue_aleluya

retfalse_aleluya:
    mov rax, 0    
    ret

rettrue_aleluya:
    mov rax, 1
    ret