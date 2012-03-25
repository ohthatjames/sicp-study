; Exercise 2.1.  Define a better version of make-rat that handles both positive and negative arguments. Make-rat should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (define (make n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (if (< d 0)
      (make (- n) (- d))
      (make n d)))

(test-case "positive n and d should have positive n and positive d"
  (let ((rat (make-rat 4 8)))
    (assert-equal 1 (numer rat))
    (assert-equal 2 (denom rat))))

(test-case "negative n and d should have positive n and positive d"
  (let ((rat (make-rat -4 -8)))
    (assert-equal 1 (numer rat))
    (assert-equal 2 (denom rat))))

(test-case "positive n and negative d should have negative n and positive d"
  (let ((rat (make-rat -4 8)))
    (assert-equal -1 (numer rat))
    (assert-equal 2 (denom rat))))

(test-case "negative n and positive d should have negative n and positive d"
  (let ((rat (make-rat 4 -8)))
    (assert-equal -1 (numer rat))
    (assert-equal 2 (denom rat))))


(tests)
