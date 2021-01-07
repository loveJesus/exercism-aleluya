;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1_aleluya dna2_aleluya)    
  "Number of positional differences in two equal length dna strands."
  (if (/= (length dna1_aleluya) (length dna2_aleluya) )
    nil
    (loop
      for char1_aleluya across dna1_aleluya
      for char2_aleluya across dna2_aleluya
      counting (char/= char1_aleluya char2_aleluya) into total_aleluya
      finally (return total_aleluya))))
