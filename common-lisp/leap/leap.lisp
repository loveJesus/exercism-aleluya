;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

;; https://www.agner.org/optimize/instruction_tables.pdf aleluya
;; If logand would compile to the TEST instruction, the
;; execution latency is 1 vs using DIV which is ~10+ cycles
;; (and requires additional operations to check remainder)
(defun divisible-4-aleluya-p
  (n_aleluya) 
  (zerop (logand n_aleluya 3)))

(defun divisible-aleluya-p
  (n_aleluya by_aleluya) 
  (zerop (mod n_aleluya by_aleluya)))

(defun leap-year-p 
  (year_aleluya)
  (and 
    (divisible-4-aleluya-p year_aleluya)        
    (or
      (not (divisible-aleluya-p year_aleluya 100))
      (divisible-aleluya-p year_aleluya 400))))

 ;; Matthew 4:17 From that time Jesus began to preach, and to say, Repent: for the kingdom of heaven is at hand. -kjv
