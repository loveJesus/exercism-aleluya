;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life. 
(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(setf dtorna_aleluya  '((#\G . #\C) (#\C . #\G) (#\T . #\A) (#\A . #\U)))

(defun to-rna (str_aleluya)
  "Transcribe a string representing DNA nucleotides to RNA."
  (concatenate 'string 
    (loop
      for char_aleluya across str_aleluya
      collect  (cdr (assoc char_aleluya dtorna_aleluya)) )))
