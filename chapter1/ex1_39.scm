; Exercise 1.39.  A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:
;
;             x
; f = --------------------
;               x^2
;      1 - --------------
;                 x^2
;         3 - -----------
;              5 - ...
;
; where x is in radians. Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert's formula. K specifies the number of terms to compute, as in exercise 1.37.

(define (cont-frac n d k)
  (define (loop i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (loop (+ i 1))))))
  (loop 1))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (square x))))
  (define (d i)
    (- (* i 2) 1))
  (cont-frac n d k))
