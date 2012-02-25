; Exercise 1.22. Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of
; time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called
; with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the
; amount of time used in performing the test.

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  elapsed-time)

; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified
; range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger
; than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of (n), you should
; expect that testing for primes around 10,000 should take about 10 times as long as testing for primes around 1000. Do your timing
; data bear this out? How well do the data for 100,000 and 1,000,000 support the n prediction? Is your result compatible with the
; notion that programs on your machine run in time proportional to the number of steps required for the computation?

(define (search-for-primes n)
  (search-for-primes-iter (if (even? n) (+ n 1) n) 3))

(define (search-for-primes-iter n count)
  (if (zero? count)
      0
      (if (timed-prime-test n)
          (search-for-primes-iter (+ n 2) (- count 1))
          (search-for-primes-iter (+ n 2) count))))

; Testing for 1,000,000 returns:
; 1000003 *** 0.
; 1000033 *** 0.
; 1000037 *** 0.

; Using larger numbers:

; 100000007 *** .01999999999999999
; 100000037 *** 3.0000000000000027e-2
; 100000039 *** 1.9999999999999962e-2

; 1000000007 *** .07
; 1000000009 *** .08000000000000002
; 1000000021 *** .08000000000000007

; 10000000019 *** .25
; 10000000033 *** .25
; 10000000061 *** .25

; 100000000003 *** .79
; 100000000019 *** .7899999999999996
; 100000000057 *** .7799999999999998

; 1000000000039 *** 2.4699999999999998
; 1000000000061 *** 2.46
; 1000000000063 *** 2.4800000000000004

; 10000000000037 *** 7.859999999999998
; 10000000000051 *** 7.920000000000002
; 10000000000099 *** 7.949999999999996

; Each jump appears to be about sqrt(10)

