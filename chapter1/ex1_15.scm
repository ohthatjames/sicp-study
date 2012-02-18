; Exercise 1.15.  The sine of an angle (specified in radians) can be computed by making use of the approximation sin x  x if x is sufficiently small, and the trigonometric identity

;                x         3  x
; sin x = 3 sin --- - 4 sin  ---
;                3            3

; to reduce the size of the argument of sin. (For purposes of this exercise an angle is considered ``sufficiently small'' if its magnitude is not greater than 0.1 radians.) These ideas are incorporated in the following procedures:

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; (/ 12.15 (expt 3 5)) = 0.05 so 5 steps
; As it jumps at exponential intervals, it's O(log n)
