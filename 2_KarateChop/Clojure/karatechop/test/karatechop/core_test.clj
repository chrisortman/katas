(ns karatechop.core-test
  (:use clojure.test
        karatechop.core))

(deftest chop-test
  (testing "Behavior of chop method"
    (is (= -1 (chop 3 [])))))