;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(ns bob)

(defprotocol BobProtoAleluya 
 (silent-aleluya? [this] )
 (shouting-aleluya? [this])
 (question-aleluya? [this])
 (response-aleluya [this]))

(defrecord BobAleluya [tstr-aleluya] 
 BobProtoAleluya
  (silent-aleluya? [this] 
   (clojure.string/blank? tstr-aleluya) )

  (shouting-aleluya? [this]
   (and
    (= tstr-aleluya (clojure.string/upper-case tstr-aleluya)  )
    (not= tstr-aleluya (clojure.string/lower-case tstr-aleluya) )))  

  (question-aleluya? [this]
   (clojure.string/ends-with? tstr-aleluya    "?"))

  (response-aleluya [this]
   (cond
    (.silent-aleluya? this)     "Fine. Be that way!"

    (and 
     (.shouting-aleluya? this)
     (.question-aleluya? this)) "Calm down, I know what I'm doing!"

    (.shouting-aleluya? this)   "Whoa, chill out!"

    (.question-aleluya? this)   "Sure."
    
    :else                       "Whatever.")))

  

(defn new-bob-aleluya 
 "Appropriate constructor for BobAleluya"
 [str-aleluya]
 (->BobAleluya (clojure.string/trim str-aleluya)))

(defn response-for [str-aleluya]
 (let [bob-aleluya (new-bob-aleluya str-aleluya)]
  (.response-aleluya bob-aleluya)))


;; Matthew 18:3 And said, Verily I say unto you, 
;; Except ye be converted, and become as little children, 
;; ye shall not enter into the kingdom of heaven. /kjv

