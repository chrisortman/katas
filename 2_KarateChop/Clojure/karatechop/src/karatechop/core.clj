(ns karatechop.core
  (:gen-class))

;Why the heck is (< 3 (count [])) not what i think?

(defn simple [arr]
	(let [c (count arr)]
		(or (= 0 c)
			(< c 3))))

(defn find-position [search start array]
	(if (= (get array start) search)
		0
		(if (< (get array start) search)
			-1
			(if (> (get array start) search )
				1))))

(defn find-middle [arr]
	(let [c (count arr)]
		(if (even? c)
			(/ c 2)
			(/ (- c 1) 2))))


(defn not-found []
	-1)

(defn find-in-simple [search array_to_search]
	(let [c (count array_to_search)]
		(= 0 c)
			(not-found)
			(if (and (= 1 c)
				(= search (get array_to_search 0)))
				0
				(if (and (= 2 c)
					(= search (get array_to_search 1)))
					1
					(not-found)))))

(defn check-edges [search_target array_to_search lower_bound upper_bound]
	(if (= search_target (get lower_bound array_to_search))
		lower_bound
		(if (= search_target (get upper_bound array_to_search))
			upper_bound
			-1)))

(defn chop [search_target array_to_search]
	"I slice and i dice yo"
	0)

	
(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))