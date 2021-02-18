; For God so loved the world, that He gave 
; His only begotten Son, that all who believe in 
; Him should not perish but have everlasting life.
section .text

;extern int square_of_sum(int number_aleluya);
global square_of_sum
square_of_sum: ; = (number_aleluya * (number_aleluya + 1)) / 2
    mov rax, rdi
    inc rax    
    mul rdi
    shr rax, 1
    mul rax
    ret

;extern int sum_of_squares(int number_aleluya);
global sum_of_squares
sum_of_squares: 
    ; =( (number_aleluya) * (number_aleluya+1) * (number_aleluya*2+1) ) * (1/6)
    ; Thanks Jesus for cover of https://www.youtube.com/watch?v=TeF09H13qyI    
    mov rax, rdi
    inc rax
    mov rdx, rdi
    add rdx, rax
    mul rdx
    mul rdi
    ; Thanks Jesus for help from https://stackoverflow.com/a/62112434 
    ; and others  on exercism to do fixed point 1/6 mul
    mov rdx, 0x2aaa_aaaa_aaaa_aaab
    mul rdx ; rdx holds surplus of mul, hallelujah
    mov rax, rdx
    ret

;extern int difference_of_squares(int number_aleluya);
global difference_of_squares
difference_of_squares:
    call sum_of_squares
    mov  r9, rax ;r9 holds square of sum aleluya
    call square_of_sum
    sub  rax, r9
    ret

;; Matthew 7:11  11 If ye then, being evil, know how to 
;; give good gifts unto your children, how much more shall 
;; your Father which is in heaven give good things to 
;; them that ask him? / kjv