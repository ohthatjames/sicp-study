; Exercise 1.46.  Several of the numerical methods described in this chapter are instances of an extremely general computational strategy known as iterative improvement. Iterative improvement says that, to compute something, we start with an initial guess for the answer, test if the guess is good enough, and otherwise improve the guess and continue the process using the improved guess as the new guess. Write a procedure iterative-improve that takes two procedures as arguments: a method for telling whether a guess is good enough and a method for improving a guess. Iterative-improve should return as its value a procedure that takes a guess as argument and keeps improving the guess until it is good enough. Rewrite the sqrt procedure of section 1.1.7 and the fixed-point procedure of section 1.3.3 in terms of iterative-improve.

(define (iterative-improve improve close-enough?)
  (lambda (first-guess)
    (define (try guess)
      (let ((next-guess) improve guess)
        (if (close-enough? guess next-guess)
            next-guess
            (try next-guess))))
      (try first-guess)))


(define tolerance 0.00001)
; Original fixed-point:
; (define (fixed-point f first-guess)
;   (define (close-enough? v1 v2)
;     (< (abs (- v1 v2)) tolerance))
;   (define (try guess)
;     (let ((next (f guess)))
;       (if (close-enough? guess next)
;           next
;           (try next))))
;   (try first-guess))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess next-guess) ((< (abs (- guess next-guess)) tolerance)))
    f)
  first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

; Original sqrt:
; (define (sqrt x)
;   (fixed-point (average-damp (lambda (y) (/ x y)))
;                1.0))
(define (sqrt x)
  ((iterative-improve
    (lambda (guess next-guess) ((< (abs (- guess next-guess)) tolerance)))
    (average-damp (lambda (y) (/ x y))))
  1.0))
