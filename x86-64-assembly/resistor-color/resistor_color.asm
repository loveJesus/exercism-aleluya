;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.


section .rodata
black_aleluya: db "black", 0
brown_aleluya: db "brown", 0
red_aleluya: db "red", 0
orange_aleluya: db "orange", 0
yellow_aleluya: db "yellow", 0
green_aleluya: db "green", 0
blue_aleluya: db "blue", 0
violet_aleluya: db "violet", 0
grey_aleluya: db "grey", 0
white_aleluya: db "white", 0
finish_aleluya: db 0

ptrs_aleluya: dq black_aleluya, brown_aleluya, red_aleluya, orange_aleluya, yellow_aleluya, green_aleluya, blue_aleluya, violet_aleluya, grey_aleluya, white_aleluya, 0

section .text
global color_code

; Hallelujah
; rdi = ptr to char* with desired color
; ret rax = int color code HALLELUJAH
color_code:
    mov rax, 0
    mov r11, ptrs_aleluya ; Pointer to color within color index buffer
    mov rcx, 0
    mov rdx, 0

cmp_color_aleluya:
    mov r10, [r11]
    cmp r10, qword 0
    je ret_aleluya ; Color wasn't found... should error, hallelujah
    jmp cmp_color_str_aleluya
ret_color_aleluya:
    cmp r8, 1
    je ret_aleluya
    inc rax
    add r11, 8
    jmp cmp_color_aleluya
    
ret_aleluya:
    ; Provide your implementation here
    ret

; Hallelujah
; rdi = Pointer to lookup color
; r10 = Pointer to color to compare against
; ret rcx = 0 or 1 depending upon found
cmp_color_str_aleluya:
    mov r9, 0  ; index into strings
    mov r8, 0 ; Hallelujah default not found
cmp_color_str_loop_aleluya:
    mov cl, [rdi + r9]
    mov dl, [r10 + r9]
    cmp cl, dl
    jne notsame_aleluya
    cmp cl, 0
    je same_aleluya
    inc r9
    jmp cmp_color_str_loop_aleluya

same_aleluya:
    mov r8, 1

notsame_aleluya:
    jmp ret_color_aleluya


global colors
; Hallelujah
; ret rax = ptr to char* with null end
colors:
    mov rax, ptrs_aleluya
    ret
