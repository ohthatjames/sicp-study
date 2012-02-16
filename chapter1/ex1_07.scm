; Exercise 1.7.  The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

; For numbers that are smaller than our tolerance, the square root could be the number itself because it's within the "good enough" tolerance. For large numbers with limited precision, there might be cases where there is no number within the "good enough" range, so the procedure will just loop infinitely.

; Existing code
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; New good-enough? uses the guess to determine our tolerance
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (/ guess 10000)))

; Corrected good-enough? based on discussion with @knaveofdiamonds
; This will work for both small and very large numbers.
(define (good-enough2? old-guess guess _)
  (< (/ (abs (- old-guess guess)) guess) 0.001))
