;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(in-package #:cl-user)
(defpackage #:two-fer
  (:use #:cl)
  (:export #:twofer))
(in-package #:two-fer)

(defun twofer (&optional name_aleluya)
	(concatenate 'string 
        "One for " 
        (or name_aleluya "you") 
        ", one for me."))

;; May our eyes be on Jesus the Messiah, the way, the truth and the life, repenting and believing in the good news https://www.jesusfilm.org/watch/jesus.html/english.html
	
