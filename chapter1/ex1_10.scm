; Exercise 1.10.  The following procedure computes a mathematical function called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?

; (A 1 10)
;
; (A 2 4)
;
; (A 3 3)
;
; Consider the following procedures, where A is the procedure defined above:
;
; Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n.

(define (f n) (A 0 n))
; 2n

(define (g n) (A 1 n))
; (A 1 n) = (A 0 (A 1 (- n 1)))
;         = (* 2 (A 1 (- n 1)))
;         = (* 2 (A 0 (A 1 (- n 2))))
;         = (* 2 (* 2 (A 1 (- n 2)))) for (n - 1) iterations, until (A 1 1) = 2
; eg (A 1 4) = (* 2 2 2 2) so:
; g(n) = 2^n

(define (h n) (A 2 n))
; (A 2 n) = (A 1 (A 2 (- n 1)))
;         = (expt 2 (A 2 (- n 1)))
;         = (expt 2 (A 1 (A 2 (- n 2))))
;         = (expt 2 (expt 2 (A 2 (- n 2)))) for (n - 1) iterations, until (A 2 1) = 2
; h(n) = 2^(2^n)
