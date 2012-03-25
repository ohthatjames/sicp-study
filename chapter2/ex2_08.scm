; Exercise 2.8.  Using reasoning analogous to Alyssa's, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called sub-interval.

(define (sub-interval i1 i2)
  (make-interval (- (lower-bound i1) (upper-bound i2))
                 (- (upper-bound i1) (lower-bound i2))))
