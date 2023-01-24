(require '[clojure.core.async])


(def waitroom-size 3)

(defrecord BarberState [occupied-seats barber-busy clients-served]
    Object
    (toString [this] (str "[" (occupied-seats barber-busy this) "]"))
)


(def state (agent (BarberState. 0 false 0)))

(defn add-to-queue-modifier [s] (assoc s :occupied-seats (+ (:occupied-seats s) 1)))

(defn pick-from-queue-modifier [s] (assoc s :occupied-seats (- (:occupied-seats s) 1)))

(defn finish-serving-modifier [s] (assoc s :barber-busy false :clients-served (+ (:clients-served s) 1)))

(defn pick-from-queue [] (if (> (:occupied-seats @state) 0)
                           (do
                             (send state pick-from-queue-modifier)
                             true)
                           false))

(defn do-haircut [] (
                     do
                      (send state assoc :barber-busy true)
                      (Thread/sleep 20)
                      (send state finish-serving-modifier)
                      (if (pick-from-queue) (do-haircut) ())))



(defn add-to-queue [] (if (< (:occupied-seats @state) waitroom-size)
                        (do
                          (send state add-to-queue-modifier)
                          true)
                        false))

(defn serve-client [] (if (:barber-busy @state) (add-to-queue) (do-haircut)))

(def endDate (.plusSeconds (java.time.LocalDateTime/now) 10))

(while (.isBefore (java.time.LocalDateTime/now) endDate) 
  (do (.start (Thread. serve-client)) (Thread/sleep (+ 10 (rand 20))) (println @state)))

(println "after sleep")
(Thread/sleep 200)
(println @state)
