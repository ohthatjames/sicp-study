; Exercise 2.5.  Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations
; if we represent the pair a and b as the integer that is the product 2^a 3^b. Give the corresponding definitions of the
; procedures cons, car, and cdr.

(define (log-base b n)
  (/ (log n) (log b)))

(define (my-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (my-car x)
  (highest-power x 2))

(define (my-cdr x)
  (highest-power x 3))

(define (highest-power n power)
  (define (loop a result)
    (if (zero? (remainder a power))
        (loop (/ a power) (+ 1 result))
        result))
  (loop n 0))

(define (test)
  (display (my-car (my-cons 8 13)))
  (newline)
  (display (my-cdr (my-cons 8 13)))
  (newline))
