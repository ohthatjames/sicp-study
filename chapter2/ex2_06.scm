; Exercise 2.6.  In case representing pairs as procedures wasn't mind-boggling enough, consider that, in a language that can manipulate procedures, we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who invented the  calculus.
;
; Define one and two directly (not in terms of zero and add-1). (Hint: Use substitution to evaluate (add-1 zero)). Give a direct definition of the addition procedure + (not in terms of repeated application of add-1).

; (add-1 zero)
; (add-1 (lambda (f1) (lambda (x1) x1)))
; (lambda (f) (lambda (x) (f ((n f) x))) (lambda (f1) (lambda (x1) x1)))
; (lambda (f) (lambda (x) (f (((lambda (f1) (lambda (x1) x1)) f) x))))

; In general,
; (((lambda (f1) (lambda (x1) x1)) f) x) can be simplified to x, because
; (lambda (f1) (lambda (x1) x1)) f) effectively ignores f so becomes
; (lambda (x1) x1)

; Simplify to:
(define one
  (lambda (f) (lambda (x) (f x))))

; (add-1 one)
; (add-1 (lambda (f1) (lambda (x1) (f1 x1))))
; (lambda (f) (lambda (x) (f ((n f) x))) (lambda (f1) (lambda (x1) (f1 x1))))
; (lambda (f) (lambda (x) (f (((lambda (f1) (lambda (x1) (f1 x1))) f) x))))

; Simplify to:
(define two
  (lambda (f) (lambda (x) (f (f x)))))

; Add
(define (add a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))

