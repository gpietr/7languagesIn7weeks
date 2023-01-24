(defn big [st n] (> (count st) n))

(defn collection-type [col] (type col))

(println (big "aaa" 2))

(println (big "aa", 2))


(println (collection-type [1 2 3]))