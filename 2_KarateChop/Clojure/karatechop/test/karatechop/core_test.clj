(ns karatechop.core-test
  (:use clojure.test
        karatechop.core))

(deftest chop-test
  (testing "Behavior of chop method"
    (is (= -1 (chop 3 [])))
	(is (= -1 (chop 3 [1])))
	(is (= 0 (chop 1 [1])))

	(is (= 0 (chop 1 [1 3 5])))
	(is (= 1 (chop 3 [1 3 5])))
	(is (= 2 (chop 5 [1 3 5])))
	(is (= -1 (chop 0 [1 3 5])))
	(is (= -1 (chop 2 [1 3 5])))
	(is (= -1 (chop 4 [1 3 5])))
	(is (= -1 (chop 6 [1 3 5])))

	(is (= 0 (chop 1 [1 3 5 7])))
	(is (= 1 (chop 3 [1 3 5 7])))
	(is (= 2 (chop 5 [1 3 5 7])))
	(is (= 3 (chop 7 [1 3 5 7])))
	(is (= -1 (chop 0 [1 3 5 7])))
	(is (= -1 (chop 2 [1 3 5 7])))
	(is (= -1 (chop 4 [1 3 5 7])))
	(is (= -1 (chop 6 [1 3 5 7])))
	(is (= -1 (chop 8 [1 3 5 7])))))