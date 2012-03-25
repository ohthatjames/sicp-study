; Exercise 2.2.  Consider the problem of representing line segments in a plane. Each segment is represented as a pair of points: a starting point and an ending point. Define a constructor make-segment and selectors start-segment and end-segment that define the representation of segments in terms of points. Furthermore, a point can be represented as a pair of numbers: the x coordinate and the y coordinate. Accordingly, specify a constructor make-point and selectors x-point and y-point that define this representation. Finally, using your selectors and constructors, define a procedure midpoint-segment that takes a line segment as argument and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints). To try your procedures, you'll need a way to print points:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-point x y)
  (cons x y))

(define (add-point p1 p2)
  (make-point (+ (x-point p1) (x-point p2))
              (+ (y-point p1) (y-point p2))))

(define (div-point point num)
  (make-point (/ (x-point point) num)
              (/ (y-point point) num)))

(define (midpoint-segment segment)
  (div-point (add-point (start-segment segment) (end-segment segment)) 2))

(test-case "add-point... adds points"
  (let ((test-point (add-point (make-point 2 3) (make-point 4 5))))
    (assert-equal 6 (x-point test-point))
    (assert-equal 8 (y-point test-point))))

(test-case "div-point... divides points"
  (let ((test-point (div-point (make-point 8 4) 2)))
    (assert-equal 4 (x-point test-point))
    (assert-equal 2 (y-point test-point))))


(test-case "midpoint-segment returns the average of the point's xs and ys"
  (let ((test-point (midpoint-segment (make-segment (make-point 2 3) (make-point 6 9)))))
    (assert-equal 4 (x-point test-point))
    (assert-equal 6 (y-point test-point))))

(tests)