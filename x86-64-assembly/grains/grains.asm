; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.
section .text
;extern uint64_t square(int64_t number);
global square
square:
    dec rdi
    cmp rdi, 63
    ja _square_err_aleluya
    mov rax, 1
    mov ecx, edi
    shl rax, cl
    ret

_square_err_aleluya:
    mov eax, 0
    ret

;extern uint64_t total(void);
global total
total:
    mov rax, -1 ;64squares = 64bit - 1
    ret
    
