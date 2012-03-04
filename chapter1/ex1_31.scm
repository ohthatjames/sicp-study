; Exercise 1.31.
; a.  The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.51 Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to  using the formula
;
; pi   2 x 4 x 4 x 6 x 6 x 8
; -- = ---------------------
; 4    3 x 3 x 5 x 5 x 7 x 7
;
; b.  If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (my-pi n)
  (define (next-even n)
    (+ n (remainder n 2)))
  (define (next-odd n)
    (+ n (- 1 (remainder n 2))))
  (define (pi-term n)
    (/ (next-even n) (next-odd n)))
  (* 4.0 (product pi-term 2 inc n)))


(test-case "Factorial"
  (assert-equal 24 (product identity 1 inc 4))
  (assert-equal 24 (product-iter identity 1 inc 4)))

(tests)
