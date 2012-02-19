(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(test-case "Powers of 2"
  (assert-equal (expt 2 0) (fast-expt 2 0))
  (assert-equal (expt 2 1) (fast-expt 2 1))
  (assert-equal (expt 2 2) (fast-expt 2 2))
  (assert-equal (expt 2 3) (fast-expt 2 3))
  (assert-equal (expt 2 4) (fast-expt 2 4))
  (assert-equal (expt 2 5) (fast-expt 2 5))
  (assert-equal (expt 2 6) (fast-expt 2 6)))

(test-case "Powers of 3"
  (assert-equal (expt 3 0) (fast-expt 3 0))
  (assert-equal (expt 3 1) (fast-expt 3 1))
  (assert-equal (expt 3 2) (fast-expt 3 2))
  (assert-equal (expt 3 3) (fast-expt 3 3))
  (assert-equal (expt 3 4) (fast-expt 3 4))
  (assert-equal (expt 3 5) (fast-expt 3 5))
  (assert-equal (expt 3 6) (fast-expt 3 6)))

(test-case "Powers of 4"
  (assert-equal (expt 4 0) (fast-expt 4 0))
  (assert-equal (expt 4 1) (fast-expt 4 1))
  (assert-equal (expt 4 2) (fast-expt 4 2))
  (assert-equal (expt 4 3) (fast-expt 4 3))
  (assert-equal (expt 4 4) (fast-expt 4 4))
  (assert-equal (expt 4 5) (fast-expt 4 5))
  (assert-equal (expt 4 6) (fast-expt 4 6)))
