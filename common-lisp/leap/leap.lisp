;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

;; https://www.agner.org/optimize/instruction_tables.pdf aleluya
;; TEST latency is 1 vs DIV which is ~10+ (and requires operations)
(defun is-divisible-4-aleluya 
  (n_aleluya) 
  (zerop (logand n_aleluya 3)))

(defun is-not-divisible-100-aleluya 
  (n_aleluya) 
  (not (zerop (mod n_aleluya 100))))

(defun is-divisible-400-aleluya 
  (n_aleluya) 
  (zerop (mod n_aleluya 400)))

(defun leap-year-p 
  (year_aleluya)
  (and 
    (is-divisible-4-aleluya year_aleluya)        
    (or
      (is-not-divisible-100-aleluya year_aleluya)
      (is-divisible-400-aleluya year_aleluya))))

 ;; Matthew 4:17 From that time Jesus began to preach, and to say, Repent: for the kingdom of heaven is at hand. -kjv
