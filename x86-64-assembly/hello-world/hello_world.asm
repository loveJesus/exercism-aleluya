; For God so loved the world, that He gave His only begotten Son, 
; that all who believe in Him should not perish but have everlasting life.
default rel

section .rodata
msg_aleluya: db "Hello, World!", 0

section .text
global hello
hello:
    lea rax, [msg_aleluya]
    ret
