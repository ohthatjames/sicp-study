; Exercise 2.3.  Implement a representation for rectangles in a plane. (Hint: You may want to make use of exercise 2.2.) 
; In terms of your constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle. 
; Now implement a different representation for rectangles. Can you design your system with suitable abstraction barriers, 
; so that the same perimeter and area procedures will work using either representation?

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-point x y)
  (cons x y))

(define (sub-point p1 p2)
  (make-point (- (x-point p1) (x-point p2))
              (- (y-point p1) (y-point p2))))

(define (make-rectangle p1 p2)
  (cons p1 p2))

(define (bottom-left-point rectangle)
  (car rectangle))

(define (top-right-point rectangle)
  (cdr rectangle))

(define (width rectangle)
  (x-point (sub-point (top-right-point rectangle) (bottom-left-point rectangle))))

(define (height rectangle)
  (y-point (sub-point (top-right-point rectangle) (bottom-left-point rectangle))))

; Because area and perimeter are defined solely with width and height,
; the implementaion of rectangles can change without affecting these functions.
(define (area rectangle)
  (* (width rectangle) (height rectangle)))

(define (perimeter rectangle)
  (+ (* 2 (width rectangle)) (* 2 (height rectangle))))
