(ns karatechop.core
  (:gen-class))

(defn middle [arr]
	(let [c (count arr) ]
		 (cond
		 	(= 0 c) -1
		 	(= 1 c) -1
		 	(= 3 c) 1
		 	(even? c) (/ c 2)
		 	(odd? c) (/ (- c 1)))))

(defn binary-split [search_target array_to_search mid-point]
	(let [middle-value (nth array_to_search mid-point)]
		 (cond
		 	(<  middle-value search_target) [(subvec array_to_search mid-point (count array_to_search)) mid-point]
		 	(>= middle-value search_target) [(subvec array_to_search 0 mid-point) 0]
		 	:else [])))

(defn chop [search_target array_to_search]
	"I slice and i dice yo"
	(println "Searching" array_to_search)
	(if (= 0 (count array_to_search))
		-1
		(let [
			  left-edge  (first array_to_search)
			  right-edge (last array_to_search)
			  mid-point (middle array_to_search)
			 ]
			 (cond 
			 	(= left-edge search_target) 0
			 	(= right-edge search_target) (- (count array_to_search) 1)
			 	(not= mid-point -1) (let [
			 								[half-array pad] (binary-split search_target array_to_search mid-point)
			 							 ]
			 							 (let [inner-result (chop search_target half-array)]
			 							 	(if (not= -1 inner-result)
			 							 		(+ pad inner-result)
			 							 		-1)))
			 	:else -1))))

	
(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))