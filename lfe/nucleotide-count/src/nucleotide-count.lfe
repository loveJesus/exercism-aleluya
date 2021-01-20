;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(defmodule dna
  (export 
    (count 2)
    (nucleotide-counts 1)))

(defun valid-n-aleluya (nuc_aleluya)
  (if 
    (lists:member (car nuc_aleluya) "ACGT")
    'true
    (erlang:error "ALELUYA")))

(defun count 
  (str_aleluya nuc_aleluya)
  (if
    (valid-n-aleluya nuc_aleluya)
    (lists:flatlength
      (lists:filter
        (lambda 
          (l_aleluya) 
          (and
            (valid-n-aleluya `(,l_aleluya))
            (== `(,l_aleluya) nuc_aleluya)))
        str_aleluya))))

(defun nucleotide-counts (str_aleluya) 
  (lists:map 
    (lambda 
      (c_aleluya)
      `#((,c_aleluya) ,(count str_aleluya `(,c_aleluya) )))
    "ACGT"))

; Matthew 4:17 
; From that time Jesus began to preach, and to say, 
; Repent: for the kingdom of heaven is at hand. -kjv

