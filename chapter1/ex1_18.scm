; Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.40

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (mult-iter 0 a b))

(define (mult-iter acc a b)
  (cond ((= b 0) acc)
        ((even? b) (mult-iter acc (double a) (halve b)))
        (else (mult-iter (+ a acc) a (- b 1)))))

(test-case "Multiplying by 0"
  (assert-equal 0 (* 1 0))
  (assert-equal 0 (* 2 0)))

(test-case "Multiplying by 1"
  (assert-equal 1 (* 1 1))
  (assert-equal 2 (* 2 1)))

(test-case "Multiplying by 2"
  (assert-equal 2 (* 1 2))
  (assert-equal 4 (* 2 2)))

(test-case "Some big numbers"
  (assert-equal 838102050 (* 12345 67890)))

(tests)
