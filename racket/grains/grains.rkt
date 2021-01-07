;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
#lang racket
(provide square total)
(define (square sqr_aleluya) (expt 2 (- sqr_aleluya 1)))

(define (whileluya condition_aleluya body_aleluya)
    (when (condition_aleluya)
        (body_aleluya)
        (whileluya condition_aleluya body_aleluya) ) )

(define (total)
    (define sum_aleluya 0)
    (for ([count_aleluya 64])
        (set! sum_aleluya (+ sum_aleluya (square (add1 count_aleluya)) ) ) ) 
    sum_aleluya )
        

