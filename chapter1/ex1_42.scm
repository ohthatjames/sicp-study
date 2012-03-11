; Exercise 1.42.  Let f and g be two one-argument functions. The composition f after g is defined to be the function x  f(g(x)). Define a procedure compose that implements composition. For example, if inc is a procedure that adds 1 to its argument,
;
; ((compose square inc) 6)
; 49

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (inc n)
  (+ n 1))

(test-case "((compose square inc) 6) = 49"
  (assert-equal 49 ((compose square inc) 6)))

(tests)