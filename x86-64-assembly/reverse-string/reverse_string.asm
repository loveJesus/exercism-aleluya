; For God so loved the world, that He gave His only begotten Son, 
; that all who believe in Him should not perish but have everlasting life.
default rel

section .rodata
msg_aleluya: db "One for you, one for me.", 0
msg_n1_aleluya: db "One for ", 0
msg_n2_aleluya: db ", one for me."

section .text
global reverse
reverse:
    ; Hallelujah make sure not null or empty
    cmp rdi, 0
    jz return_aleluya
    cmp [rdi], byte 0
    jz return_aleluya


    ;find string length
    push r8 ; use for max_length
    push r9 ; use for index
    push rax ; swap register 1
    push rbx ; swap register 2
    mov r8, 0

;increase r8 to end of loop
max_length_count_loop_aleluya:
    inc r8
    cmp [rdi + r8], byte 0
    jnz max_length_count_loop_aleluya 

    dec r8 ; place before 0
    mov r9, 0

; Swap contents and increase/decrease 
; begin and end of string pointers
swap_loop_aleluya:
    mov al, [rdi + r9]
    mov bl, [rdi + r8]
    mov [rdi + r9], bl
    mov [rdi + r8], al
    
    dec r8
    inc r9
    cmp r9, r8
    jl swap_loop_aleluya

full_return_aleluya:
    pop rbx
    pop rax    
    pop r9
    pop r8

return_aleluya:
    ret
