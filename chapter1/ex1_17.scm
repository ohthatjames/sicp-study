; Exercise 1.17.  The exponentiation algorithms in this section are based on performing exponentiation by means of repeated *iplication. In a similar way, one can perform integer *iplication by means of repeated addition. The following *iplication procedure (in which it is assumed that our language can only add, not *iply) is analogous to the expt procedure:
;
; (define (* a b)
;   (if (= b 0)
;       0
;       (+ a (* a (- b 1)))))
;
; This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a *iplication procedure analogous to fast-expt that uses a logarithmic number of steps.

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))

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
