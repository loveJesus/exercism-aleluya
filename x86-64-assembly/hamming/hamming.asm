; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.

section .text
global distance
; Hallelujah - Calc Hamming distance
; rdi - * char, str_a_aleluya
; rsi - * char, str_b_aleluya
; ret rax - int distance, -1 on error
; ~vars:
;   rcx - index
;   dh,dl - hold the chars
distance:
    mov rax, 0
    mov rcx, 0 ; index

loopleluya:
    mov dl, [rdi + rcx]
    mov dh, [rsi + rcx]
    inc rcx
    test dl, dh ; test for at least one is 0
    je is_end_aleluyap     
    cmp dh, dl 
    je loopleluya
    inc rax
    jmp loopleluya 

error_leluya:
    mov rax, -1
    ret

is_end_aleluyap:
    cmp dh, dl ; both must be 0
    jne error_leluya
    ret

; Mat 7:12 Therefore all things whatsoever ye would 
; that men should do to you, do ye even so to them: 
; for this is the law and the prophets.


