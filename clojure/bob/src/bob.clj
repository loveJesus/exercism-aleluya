;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(ns bob)

(defn is-blank-trimmed-aleluya? 
 [str-aleluya] 
 (clojure.string/blank? str-aleluya))

(defn is-question-trimmed-aleluya? 
 [str-aleluya] 
 (clojure.string/ends-with? str-aleluya "?"))


(defn is-shouting-trimmed-aleluya? 
 [str-aleluya] 
 (and
  (= str-aleluya (clojure.string/upper-case str-aleluya)  )
  (not= str-aleluya (clojure.string/lower-case str-aleluya) )))


(defn response-for [str-aleluya]
 (let [s-aleluya (clojure.string/trim str-aleluya)]
  (cond
   (is-blank-trimmed-aleluya? s-aleluya) 
    "Fine. Be that way!"  
   (is-shouting-trimmed-aleluya? s-aleluya)
    (if 
     (is-question-trimmed-aleluya? s-aleluya)
     "Calm down, I know what I'm doing!"
     "Whoa, chill out!")
   (is-question-trimmed-aleluya? s-aleluya) 
    "Sure."
   :else 
    "Whatever.")))


;; Matthew 18:3 And said, Verily I say unto you, 
;; Except ye be converted, and become as little children, 
;; ye shall not enter into the kingdom of heaven. /kjv

