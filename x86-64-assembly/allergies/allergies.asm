; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.
section .text

;enum item { EGGS, PEANUTS, SHELLFISH, STRAWBERRIES, TOMATOES, CHOCOLATE, POLLEN, CATS, MAX_ITEMS };
;struct item_list { int size; enum item items[MAX_ITEMS] };

MAX_ITEMS_ALELUYA equ 8

; extern int allergic_to(enum item item, unsigned int score);
global allergic_to
allergic_to:
    mov rax, 1
    mov rcx, rdi
    shl rax, cl
    and rax, rsi  ;non zero equals true in C - aleluya      
    ret


; extern void list(unsigned int score, struct item_list *list);
global list
list:
    mov rdx, 0      ;items_count_aleluya
    mov r9, 1       ;and_tester_aleluya
    mov ecx, 0      ;current_item_testing_aleluya
_loop_aleluya:    
    test rdi, r9
    jne _has_item_aleluya
_continuer_aleluya:      
    shl r9, 1
    inc ecx  
    cmp ecx, MAX_ITEMS_ALELUYA
    jne _loop_aleluya
    mov [rsi], edx
    ret 

_has_item_aleluya:
    ; Aleluyassuming enum is 32bits
    mov [rsi + 4 + rdx * 4], ecx 
    inc edx
    jmp _continuer_aleluya

