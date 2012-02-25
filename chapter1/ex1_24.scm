; Exercise 1.24.  Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has (log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime n (- (runtime) start-time))
      #f))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  elapsed-time)

(define (search-for-primes n)
  (search-for-primes-iter (if (even? n) (+ n 1) n) 3))

(define (search-for-primes-iter n count)
  (if (zero? count)
      0
      (if (timed-prime-test n)
          (search-for-primes-iter (+ n 2) (- count 1))
          (search-for-primes-iter (+ n 2) count))))


(search-for-primes 1000000000)
(search-for-primes 10000000000)
(search-for-primes 100000000000)
(search-for-primes 1000000000000)
(search-for-primes 10000000000000)

; 1000000007 *** 2.0000000000000018e-2
; 1000000009 *** 9.999999999999981e-3
; 1000000021 *** 1.0000000000000009e-2
; 10000000019 *** 9.999999999999981e-3
; 10000000033 *** 2.0000000000000018e-2
; 10000000061 *** .01999999999999999
; 100000000003 *** 1.0000000000000009e-2
; 100000000019 *** 1.0000000000000009e-2
; 100000000057 *** 1.0000000000000009e-2
; 1000000000039 *** 2.0000000000000018e-2
; 1000000000061 *** 1.9999999999999962e-2
; 1000000000063 *** 2.0000000000000018e-2
; 10000000000037 *** 2.0000000000000018e-2
; 10000000000051 *** 1.9999999999999962e-2
; 10000000000099 *** 2.0000000000000018e-2

; Seems to be much faster than log(10) growth... No idea why....
