; Exercise 1.8.  Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
;
; (x / (y^2)) + 2y
; ----------------
;        3
;
; Use this formula to implement a cube-root procedure analogous to the square-root procedure.

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (average x y)
  (/ (+ x y) 2))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (/ guess 10000)))
