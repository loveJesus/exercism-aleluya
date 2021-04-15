;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
BITS 64
DEFAULT REL
global is_paired
MAXSTACK_ALELUYA EQU 4096


section .text

;extern int is_paired(const char *str_hallelujah);
;rdi - null terminated string to check for is_paired
;return rax 0 or 1 if it is a paired

;r8 -> input string ptr aleluya
;r10 -> pops ptr aleluya
is_paired:
    mov r8, 0
    mov r10, 0
    mov r12, stack_aleluya
    mov r13, pops_aleluya
    mov r14, depops_aleluya

_loop_str_aleluya: 
    mov cl, [rdi + r8]
    cmp cl, 0
    je _paired_chk1_aleluya
    inc r8
    mov r11, 0
_loop_pops_aleluya:
    mov dl, [r13 + r11]
    cmp dl, 0
    je _is_not_pops_aleluya
    cmp dl, cl
    je _is_pops_aleluya
    inc r11
    jmp _loop_pops_aleluya


_is_not_pops_aleluya:
    mov r11, 0
_loop_depops_aleluya:
    mov dl, [r14 + r11]
    cmp dl, 0
    je _loop_str_aleluya
    cmp dl, cl
    je _is_depops_aleluya
    inc r11
    jmp _loop_depops_aleluya


_is_pops_aleluya:
    mov dl, [r14 + r11]
    mov [r12 + r10], dl
    inc r10
    jmp _loop_str_aleluya

    
_is_depops_aleluya:
    cmp r10, 0
    je _empty_pops_stack_error_aleluya
    mov dl, [r12 + r10 - 1]
    cmp dl, cl 
    jne _wrong_depops_aleluya
    dec r10
    jmp _loop_str_aleluya

_paired_chk1_aleluya:
    cmp r10, 0
    jne _not_all_closed_aleluya
    mov rax, 1
    ret

_empty_pops_stack_error_aleluya:
_wrong_depops_aleluya:
_not_all_closed_aleluya:
    mov rax, 0
    ret



section .data
    ;ascii (40 )41 {123 }125 [91 ]93  - Hallelujah
    pops_aleluya: db 40, 123, 91, 0
    depops_aleluya: db 41, 125, 93, 0

section .bss
    stack_aleluya: resb MAXSTACK_ALELUYA