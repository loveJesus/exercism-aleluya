;; For God so loved the world, that He gave His only begotten Son, 
;; that all who believe in Him should not perish but have everlasting life.
(ns bob)
(defn response-for [str-aleluya]
 (let [s-aleluya (clojure.string/trim str-aleluya)]
  (cond
   (= s-aleluya "") "Fine. Be that way!"  
   (and 
    (= s-aleluya (clojure.string/upper-case s-aleluya)  )
    (not= s-aleluya (clojure.string/lower-case s-aleluya) ))
    (if (= (last s-aleluya) \?)
     "Calm down, I know what I'm doing!"
     "Whoa, chill out!")
   (= (last s-aleluya) \?) "Sure."
   :else "Whatever.")))

