; Exercise 2.34.  Evaluating a polynomial in x at a given value of x can be formulated as an accumulation. We evaluate the polynomial using a well-known algorithm called Horner's rule, which structures the computation as
;
; In other words, we start with an, multiply by x, add an-1, multiply by x, and so on, until we reach a0.16 Fill in the following template to produce a procedure that evaluates a polynomial using Horner's rule. Assume that the coefficients of the polynomial are arranged in a sequence, from a0 through an.

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x)))
              0
              coefficient-sequence))

