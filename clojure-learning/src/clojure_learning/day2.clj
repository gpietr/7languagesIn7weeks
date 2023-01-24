(defprotocol Calculator
    (multiply [c n])
    (add [c n])
)

(defrecord CalculatorWithMemory [memory]
    Calculator
    (add [_ n] (CalculatorWithMemory. (+ memory n)))

    (multiply [_ n] (CalculatorWithMemory. (* memory n)))

    Object
        (toString [this] (str "[" (memory this) "]"))
    )



(defmacro unless [test body]
    (list 'if (list 'not test) body))

(defmacro unless-else [test body else-body] 
    (list 'if (list 'not test) body else-body))


(def calc (CalculatorWithMemory. 0))

(println(add calc 2))

(println(multiply (add calc 4) 2))

(println calc)


(unless-else (= 5 10) (println "math sucks") (println "math rocks"))