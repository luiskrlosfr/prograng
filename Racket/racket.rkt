#lang racket

  ; (car '(1 2 3 4))
  ; (cdr '(1 2 3 4))
  ; (car '((a) b c d))
  ; (cdr '((a) b c d))
  ; (car '((a b c) 2 3 4))
  ; (cdr '((a b c) 2 3 4))

  ; (cadr '(1 2 3 4 5))

  ; (null? '())

  ; (cons 1 '(2 3 4 5))
  ; (list 1 2 3 4 5)
  ; (cons 1 '((2 3 4 5)))
  ; (list 1 (list 2 3 4 5))
  ; (list '(1 2) '(3 4))
  ; (append '(1 2) '(3 4))

  ; ((lambda (x) (* x x)) 5)

  ; (define (myReverse x)
  ;   (if (null? x)
  ;     x
  ;     (append (myReverse (cdr x)) (list (car x)))
  ;   )
  ; )

(define (enigmaA x y)
  (if (null? x)
    (list y)
    (cons
      (cons
        (car (reverse x)) (list (car x)))
        (enigmaA (cdr x) (+ y 1))
    )
  )
)

(define (enigmaB x y)
  (let ((a y))
    (let ((b x))
      (list
        (* a (+ b 1))
        (if (> a b) (list b) b)
      )
    )
  )
)

(define (enigmaC x)
  ; (map * x x)
  ; (append (map * x x) '(2 3))
  ; (apply * 1 4 (append (map * x x) '(2 3)))
  (apply - (apply * 1 4 (append (map * x x) '(2 3))) '(100))
)

(define (enigmaD x y)
  (- (( lambda (y) (- y 2)) x) y)
)

(define (removeRep lst)
  (if (null? lst)
    '()
    (if (exists? (car lst) (cdr lst))
      (removeRep (cdr lst))
      (cons (car lst) (removeRep (cdr lst)))
    )
  )
)

(define (exists? elem lst)
  (if (null? lst)
    #f
    (if (equal? elem (car lst))
      #t
      (exists? elem (cdr lst))
    )
  )
)

(define (returnA lst)
  (if (null? lst)
    '()
    (if (list? (car lst))
      (cons (returnA (car lst)) (returnA (cdr lst)))
      (if (null? (filter (lambda (x) (equal? x "a")) lst))
        '()
        (filter (lambda (x) (not (equal? x "a"))) lst)
      )
    )
  )
)

(define (useCond x)
  (cond 
    ((< (car x) 5) (map * x x))
    ((> (car x) 5) (apply + x))
    (else (filter (lambda (y) (equal? y 5)) x))
  )
)

(member 5 '(6 7 8 9 10))