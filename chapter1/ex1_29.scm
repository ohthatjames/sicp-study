; Exercise 1.29.  Simpson's Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson's Rule, the integral of a function f between a and b is approximated as
;
; ...
;
; where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above.


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))

(display (integral cube 0 1 0.01))
(newline)
(display (integral cube 0 1 0.001))
(newline)

(define (simpson-integral f a b n)
  (let ((h (/ (- b a) n)))
    (define (y k)
      (f (+ a (* k h))))
    (define (inc x) (+ 1 x))
    (define (apply-y x)
      (cond ((= 0 x) (y 0))
            ((= (remainder x 2) 0) (* 2 (y x)))
            (else (* 4 (y x)))))
    (* (/ h 3.0) (sum apply-y 0 inc n))))

(display (simpson-integral cube 0 1.0 100))
; .25333333333333324
(newline)
(display (simpson-integral cube 0 1.0 1000))
; .2503333333333336
(newline)

; Can't figure out why this doesn't work.
; It starts *above* the limit and then gets smaller, but it's further away from the integral versino...
