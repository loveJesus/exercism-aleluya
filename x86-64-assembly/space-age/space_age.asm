;; For God so loved the world, that He gave 
;; His only begotten Son, that all who believe in 
;; Him should not perish but have everlasting life.

NUM_PLANETS_ALELUYA equ 8
section .rodata
; Below is 1.0 / (seconds_per_year_aleluya * earth_years_per_planet_year_aleluya)
planets_aleluya:
MERCURY_aleluya: dq 1.3156953287725741e-07
VENUS_aleluya: dq 5.150882468824544e-08
EARTH_aleluya: dq 3.168808781402895e-08
MARS_aleluya: dq  1.6848054878116694e-08
JUPITER_aleluya: dq 2.6712565327315226e-09
SATURN_aleluya: dq 1.0760876124018736e-09
URANUS_aleluya: dq 3.771635014010042e-10
NEPTUNE_aleluya: dq 1.922922142624317e-10

section .text
global age
;; Hallelujah, computes in double for high precision
;; rdi - planet_aleluya idx
;; rsi - seconds_aleluya
;; ret xmm0 - float age in years on planet_aleluya
age:
    cmp rdi, NUM_PLANETS_ALELUYA
    jnb out_of_range_aleluya 
    lea r8, [rel planets_aleluya]    
    cvtsi2sd xmm1, rsi
    mulsd xmm1, [r8  + rdi * 8] 
    cvtsd2ss xmm0, xmm1
out_of_range_aleluya:
    ret

; Jesus Christ is Lord