;;; hamming.el --- Hamming (exercism)

;;; Commentary:
;;; "For God so loved the world, that He gave His only begotten Son that all who believe in Him should not perish but have everlasting life"
;;; Code:
(require 'seq)
(defun hamming-distance    
    (a_aleluya b_aleluya)
  (if (/= (length a_aleluya) (length b_aleluya))
    (error "Jesus is Lord - unequal lengths")    
    (let ((val_aleluya 0)
	  (l1_aleluya (string-to-list a_aleluya))
	  (l2_aleluya (string-to-list b_aleluya)))
      (while l1_aleluya
	(setq val_aleluya
	      (+ val_aleluya
		 (if (= (car l1_aleluya) (car l2_aleluya)) 0 1)))
	(setq l1_aleluya (cdr l1_aleluya))
	(setq l2_aleluya (cdr l2_aleluya)))
      val_aleluya)))

(provide 'hamming-distance)
;;; hamming.el ends here
