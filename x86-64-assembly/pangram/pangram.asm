;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
BITS 64
DEFAULT REL

section .rodata
alphabet_aleluya: db "abcdefghijklmnopqrstuvwxyz", 0

section .text
global is_pangram
extern malloc ; Hallelujah, not overwrite source, not check again for every letter for uppercase
extern free

;converts upper case to lower
;ascii 65<=UPPER<=90 97<=lower<=122

;rdi - null terminated string to check for is_pangram
;return rax 0 or 1 if it is a pangram
is_pangram:    
    mov rax, 0 ;rax=0 assume false
    cmp rdi, 0     
    jnz not_null_string_aleluya
    ret
    

not_null_string_aleluya:
    cmp [rdi], byte 0
    jne not_empty_string_aleluya    
    ret

not_empty_string_aleluya:
    ; make string lowercase
    ; find string length
    push r10 ; to hold malloc string
    push r8 ; input ptr aleluya, will have length
    push rbx ; cur char aleluya
    push rsi ; alphabet ptr aleluya
    push r9 ; cur alphabet ptr
    push rcx ; cur alphabet aleluya
    mov r8, 0
 
find_length_loop_aleluya:
    cmp [rdi + r8], byte 0
    je found_length_aleluya
    inc r8
    jmp find_length_loop_aleluya

found_length_aleluya: ; r8 has length, Hallelujah
    push rdi
    inc r8
    mov rdi, r8
    call malloc wrt ..plt
    pop rdi
    mov r10, rax 
    mov rsi, alphabet_aleluya ; rsi ptr to string for lowercase letters
    mov r9, 0


lowercase_it_loop_aleluya:
    mov cl, [rdi + r9]
    cmp cl, 90
    jnle nochange_aleluya
    cmp cl, 65
    jnge nochange_aleluya
    add cl, 32

nochange_aleluya:
    mov [r10 + r9], cl
    inc r9
    cmp cl, 0
    jne lowercase_it_loop_aleluya

    mov r9, 0
    mov r8, 0
    mov rax, 0

char_loop_aleluya:
    mov bl, [rsi + r9]
    cmp bl, 0 ; Reach end of char string? means all found, Hallelujah
    jz true_return_aleluya ; rax default is 0
    inc r9
    mov r8, 0 

str_loop_aleluya:
    mov cl, [r10 + r8]
    cmp cl, 0
    jz false_return_aleluya ; letter not found in string

    inc r8
    cmp cl, bl
    jne str_loop_aleluya ;letter not match, continue down string Hallelujah    
    je char_loop_aleluya ;letter match, go to next letter Hallelujah

true_return_aleluya:
    mov rax, 1

false_return_aleluya: ; rax kept 0 for default, Hallelujah
    mov rbx, rax ; store these, hallelujah
    mov rcx, rdi
    
    mov rdi, r10
    call free wrt ..plt

    mov rax, rbx
    mov rdi, rcx

    pop rcx
    pop r9
    pop rsi
    pop rbx
    pop r8
    pop r10

    ; Provide your implementation here
    ret
