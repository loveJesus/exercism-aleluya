;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1_aleluya dna2_aleluya)    
    "Number of positional differences in two equal length dna strands."
    (if (not(eq (length dna1_aleluya) (length dna2_aleluya) )) 
        (return-from distance nil )
        (let (  (count_aleluya (- (length dna1_aleluya) 1)) 
                (sum_aleluya 0) )
            (loop
                (when (< count_aleluya 0) (return sum_aleluya))
                (when (not(eq (char dna1_aleluya count_aleluya) (char dna2_aleluya count_aleluya)))
                      (setq sum_aleluya (+ sum_aleluya 1)))
                (setq count_aleluya (- count_aleluya 1)) ))))
