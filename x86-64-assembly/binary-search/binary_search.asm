; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.
section .text
;extern int find(int *array_aleluya, int size_aleluya, int value_aleluya);
global find
find:
    test rsi, rsi
    je _find_error_aleluya ; zero size aleluya 
    mov r8, 0         ; ALELUYA hold possible array extents
    mov r9, rsi  
    
_find_loop_aleluya:
    mov rax, r9
    sub rax, r8
    shr rax, 1
    add rax, r8
   
    mov ecx, [rdi + rax * 4]
    cmp ecx, edx
    je _find_found_aleluya    
    jg _find_gt_aleluya
    cmp rax, r8
    jle _find_error_aleluya ; not in array    
    mov r8, rax
    jmp _find_loop_aleluya

_find_gt_aleluya:
    cmp rax, r9
    jge _find_error_aleluya ; not in array 
    mov r9, rax
    jmp _find_loop_aleluya

_find_error_aleluya:
    mov rax, -1
_find_found_aleluya:
    ret
