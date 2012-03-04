; Exercise 1.33.  You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:
;
; a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
;
; b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (filtered-accumulator combiner null-value filter term a next b)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (filtered-accumulator combiner null-value filter term (next a) next b)))
        (else (filtered-accumulator combiner null-value filter term (next a) next b))))

(define (inc n) (+ 1 n))

(define (identity n) n)

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

(define (sum-of-squares-of-primes n)
  (filtered-accumulator + 0 prime? square 0 inc n))

(test-case "Sum of squares of primes"
  (assert-equal 88 (sum-of-squares-of-primes 10)))

(tests)
