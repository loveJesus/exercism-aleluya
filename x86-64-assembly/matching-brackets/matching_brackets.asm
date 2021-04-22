;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
BITS 64
DEFAULT REL
global is_paired

section .data
    ;ascii (40 )41 {123 }125 [91 ]93  - Hallelujah
    pushes_aleluya: db '({[', 0 ;Praise the Lord, could add more bracket types here
    pops_aleluya: db ')}]', 0 ;Hallelujah closing bracket must match opening bracket index

section .text
;extern int is_paired(const char *str_hallelujah);
;INPUT:
;   rdi - null terminated string to check for is_paired
;RETURN:
;   rax - return 0 or 1 if it is a paired

;r8 -> input string ptr aleluya
;r9 -> hold rsp aleluya
;r10 -> opening bracket array (null terminated) aleluya
;r12 -> callee saved - closing bracket array (null terminated) aleluya
;cl -> input string current char aleluya
;dl -> temporary valuye depending upon block aleluya
;r11 -> temporary index into arrays depending upon block aleluya
is_paired:
    mov r8, 0
    push r12
    mov r9, rsp
    push 0
    mov r10, pushes_aleluya
    mov r12, pops_aleluya

_loop_str_aleluya: 
    mov cl, [rdi + r8]
    cmp cl, 0
    je _paired_chk1_aleluya
    inc r8
    mov r11, 0

_loop_pushes_aleluya:
    mov dl, [r10 + r11]
    cmp dl, 0
    je _is_not_push_aleluya
    cmp dl, cl
    je _is_push_aleluya
    inc r11
    jmp _loop_pushes_aleluya


_is_not_push_aleluya:
    mov r11, 0

_loop_pops_aleluya:
    mov dl, [r12 + r11]
    cmp dl, 0
    je _loop_str_aleluya
    cmp dl, cl
    je _is_pops_aleluya
    inc r11
    jmp _loop_pops_aleluya


_is_push_aleluya:
    movzx rdx, byte [r12 + r11]
    push rdx
    jmp _loop_str_aleluya

    


_paired_chk1_aleluya:
    pop rdx
    cmp rdx, 0
    jne _not_all_closed_aleluya
    mov rax, 1
    pop r12
    ret

_is_pops_aleluya:
    pop rdx
    cmp rdx, 0
    je _empty_pops_stack_error_aleluya

    cmp dl, cl 
    je _loop_str_aleluya
    ; Wrong bracket close if reaching here and fail - Glory to Jesus
_wrong_pops_aleluya:
_empty_pops_stack_error_aleluya:
_not_all_closed_aleluya:
    mov rax, 0
    mov rsp, r9
    pop r12
    ret


