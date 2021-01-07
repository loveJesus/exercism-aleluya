; For God so loved the world, that He gave His only begotten Son, 
; that all who believe in Him should not perish but have everlasting life.
default rel

section .rodata
msg_aleluya: db "One for you, one for me.", 0
msg_n1_aleluya: db "One for ", 0
msg_n2_aleluya: db ", one for me."

section .text
global two_fer
two_fer:		
	;cmp rax, 0
	cmp rdi, 0 ; Hallelujah is name null?
	jnz do_copy_name_aleluya ;if not, copy with name
	jmp do_copy_standard_aleluya ;if so, copy with 'you'
	ret

do_copy_name_aleluya: ; Copy with name in middle Hallelujah
	push r8
	push rdx
	mov r8, 0 ; Output pointer

	lea rax,[msg_n1_aleluya]
	call fn_copy_aleluya

	mov rax, rdi
	call fn_copy_aleluya
	lea rax,[msg_n2_aleluya]
	call fn_copy_aleluya
	mov [rsi + r8], byte 0
	pop rdx
	pop r8
	ret

; Praise the Lord Jesus
do_copy_standard_aleluya: ; Copy with 'you' from msg_aleluya, praise the Lord Jesus
	push r8
	push rdx
	mov r8, 0
	lea rax,[msg_aleluya]
	call fn_copy_aleluya
	mov [rsi + r8], byte 0
	pop rdx
	pop r8
	ret

; rax = output copy from base Aleluya
; r8 = output pointer delta Aleluya
; rsi = output pointer Aleluya
fn_copy_aleluya: 
	push r9
	mov r9,0
ifn_copy_aleluya:
	mov dl,[rax + r9]		
	cmp dl,0
	je ifn_doneish_aleluya
	mov [rsi + r8], dl
	inc r8
	inc r9
	jmp ifn_copy_aleluya
ifn_doneish_aleluya:
	pop r9
	ret

; There is no other way to the Father but through Jesus Christ
; He still does miracles like 2000 years ago! audacitymovie.com 
; https://www.jesusfilm.org/watch/jesus.html/english.html


