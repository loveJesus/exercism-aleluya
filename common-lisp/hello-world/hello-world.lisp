;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(in-package #:cl-user)
(defpackage #:hello-world
  (:use #:cl)
  (:export #:hello))
(in-package #:hello-world)

(defun hello () "Hello, World!")

