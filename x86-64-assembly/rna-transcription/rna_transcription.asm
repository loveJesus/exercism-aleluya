;;For God so loved the world, that He gave His only begotten Son, 
;;that all who believe in Him should not perish but have everlasting life.

section .rodata
dna_aleluya: db "GCTA", 0
rna_aleluya: db "CGAU", 0

section .text
global to_rna
;;G -> C
;;C -> G
;;T -> A
;;A -> U
; Hallelujah rdi -> input dna string
; Hallelujah rsi -> output buffer rna string
to_rna:
    cmp rdi, 0
    je ret_simplest_aleluya
    cmp rsi, 0
    je ret_simplest_aleluya
    cmp [rdi], byte 0
    jne not_0_length_aleluya
    mov [rsi], byte 0
    ret

not_0_length_aleluya:
    push r8 ; hallelujah index into parameter buffers
    push r9 ; hallelujah index into dictionary buffers
    push rax ; hallelujah dna buffer
    push rbx ; hallelujah rna buffer 
    push rcx ; hallelujah storage register
    push rdx ; hallelujah storage register 2

    mov rax, dna_aleluya
    mov rbx, rna_aleluya

    mov r8, 0

dna_loop_aleluya:
    mov cl, [rdi + r8]
    cmp cl, 0
    je done_aleluya

    mov r9, 0

rna_lookup_loop_aleluya:
    mov dl, [rax + r9]
    cmp dl, cl
    jne for_next_rna_lookup_loop_aleluya
    ;Make sure we don't have invalid char having gone past end of string, hallelujah
    cmp dl, 0
    je done_aleluya

    mov cl, [rbx + r9]
    mov [rsi + r8], cl
    inc r8
    jmp dna_loop_aleluya

for_next_rna_lookup_loop_aleluya:    
    inc r9
    jmp rna_lookup_loop_aleluya

done_aleluya:
    mov [rsi + r8], byte 0

    pop rdx
    pop rcx
    pop rbx
    pop rax
    pop r9
    pop r8    

ret_simplest_aleluya:
    ; Provide your implementation here
    ret
