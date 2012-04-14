; Exercise 2.18.  Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:
;
; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

(define (reverse lst)
  (define (reverse-iter orig-list new-list)
    (if (null? orig-list)
        new-list
        (reverse-iter (cdr orig-list) (cons (car orig-list) new-list))))
  (reverse-iter lst (list)))