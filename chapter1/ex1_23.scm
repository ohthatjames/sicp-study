; Exercise 1.23. The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks
; to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This
; suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this
; change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the
; smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this
; modified version of smallest-divisor, run the test for each of the 12 primes found in exercise 1.22. Since this modification halves
; the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the
; observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?

(define (smallest-divisor n)
  (find-divisor n 2))
(define (next test-divisor)
  (if (= test-divisor 2) 3 (+ test-divisor 2)))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
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

(define (search-for-primes n)
  (search-for-primes-iter (if (even? n) (+ n 1) n) 3))

(define (search-for-primes-iter n count)
  (if (zero? count)
      0
      (if (timed-prime-test n)
          (search-for-primes-iter (+ n 2) (- count 1))
          (search-for-primes-iter (+ n 2) count))))

; 100000007 *** 2.0000000000000018e-2
; 100000037 *** 2.0000000000000018e-2
; 100000039 *** 1.0000000000000009e-2

; 1000000007 *** 4.0000000000000036e-2
; 1000000009 *** 4.0000000000000036e-2
; 1000000021 *** 5.0000000000000044e-2

; 10000000019 *** .1499999999999999
; 10000000033 *** .16000000000000014
; 10000000061 *** .1499999999999999

; 100000000003 *** .4900000000000002
; 100000000019 *** .48
; 100000000057 *** .48

; 1000000000039 *** 1.54
; 1000000000061 *** 1.5699999999999994
; 1000000000063 *** 1.5699999999999994

; 10000000000037 *** 4.85
; 10000000000051 *** 4.85
; 10000000000099 *** 4.850000000000001

; It is faster, but not twice as fast. Maybe because even though we've halved the number of operations that need to be performed in that function, we haven't halved everything? Or the if statement is slower than just incrementing by 1?
