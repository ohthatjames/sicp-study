; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
; Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f-iter n)
  (if (< n 3)
      n
      (f-iter1 n 2 2 1 0)))

(define (f-iter1 n current n1 n2 n3)
  (if (= n current)
      n1
      (f-iter1 n (+ current 1) (+ n1 ( * 2 n2) (* 3 n3)) n1 n2)))
