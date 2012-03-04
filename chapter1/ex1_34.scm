; Exercise 1.34.  Suppose we define the procedure
;
; (define (f g)
;   (g 2))
;
; Then we have
;
; (f square)
; 4
;
; (f (lambda (z) (* z (+ z 1))))
; 6
;
; What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

; (f f)
; (f 2)
; (2 2)

; It will try and apply 2 to 2, which is not a procedure, so it will error out.
