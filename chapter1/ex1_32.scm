; Exercise 1.32.  a. Show that sum and product (exercise 1.31) are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
;
; (accumulate combiner null-value term a next b)
;
; Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.
;
; b. If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

(define (accumulator combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
      (accumulator combiner null-value term (next a) next b))))

(define (accumulator-iter combiner null-value term a next b)
  (define (loop a result)
    (if (> a b)
        result
        (loop (next a) (combiner (term a) result))))
  (loop a null-value))

(define (sum term a next b)
  (accumulator + 0 term a next b))

(define (sum-iter term a next b)
  (accumulator-iter + 0 term a next b))

(define (product term a next b)
  (accumulator * 1 term a next b))

(define (product-iter term a next b)
  (accumulator-iter * 1 term a next b))

(define (inc n)
  (+ 1 n))

(define (identity x)
  x)

(test-case "Test sum"
  (assert-equal 55 (sum identity 0 inc 10))
  (assert-equal 55 (sum-iter identity 0 inc 10)))

(test-case "Test product"
  (assert-equal 24 (product identity 1 inc 4))
  (assert-equal 24 (product-iter identity 1 inc 4)))

(tests)