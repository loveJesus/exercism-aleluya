;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life. 
;;* `G` -> `C`
;;* `C` -> `G`
;;* `T` -> `A`
;;* `A` -> `U`
(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(setf dna_aleluya "GCTA")
(setf rna_aleluya "CGAU")

(defun dna-to-rna-aleluya (char_aleluya)
  (loop
    for dna_char_aleluya across dna_aleluya
    for rna_char_aleluya across rna_aleluya
    do 
      (when 
        (char= dna_char_aleluya char_aleluya)
        (return rna_char_aleluya ))))

(defun to-rna (str_aleluya)
  "Transcribe a string representing DNA nucleotides to RNA."
  (concatenate 'string 
    (loop
      for char_aleluya across str_aleluya
      collect (dna-to-rna-aleluya char_aleluya))))
