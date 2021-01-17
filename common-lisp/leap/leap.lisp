;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year_aleluya)
  (and 
    (= (logand year_aleluya 3) 0)        
    (or
      (/= (mod year_aleluya 100) 0)
      (= (mod year_aleluya 400) 0))))

 ;; Matthew 4:17 From that time Jesus began to preach, and to say, Repent: for the kingdom of heaven is at hand. -kjv
