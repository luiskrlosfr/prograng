#lang racket

; Problem #1

(define (lessthan pivot lst)
    (if (null? lst)
        '()
        (if (< (car lst) pivot)
            (cons (car lst) (lessthan pivot (cdr lst)))
            (lessthan pivot (cdr lst))
        )
    )
)

(define (morethan pivot lst)
    (if (null? lst)
        '()
        (if (> (car lst) pivot)
            (cons (car lst) (morethan pivot (cdr lst)))
            (morethan pivot (cdr lst))
        )
    )
)

(define (quicksort x)
    (if (null? x)
        '()
        (append (quicksort (lessthan (car x) (cdr x))) (list (car x)) (quicksort (morethan (car x) (cdr x))))
    )
)

; Problem #3

(define (male lst)
    (if (null? lst)
        '()
        (if (equal? (car(car lst)) "Male")
            (append (cdr(car lst)) (male (cdr lst)))
            (male (cdr lst))
        )
    )
)

(define (female lst)
    (if (null? lst)
        '()
        (if (equal? (car(car lst)) "Female")
            (append (cdr(car lst)) (female (cdr lst)))
            (female (cdr lst))
        )
    )
)

(define (tableSum lst)
    (cons (list "Female" (+ (/ (apply + (female lst)) (length (female lst))) 0.00)) (list (list "Male" (+ (/ (apply + (male lst)) (length (male lst))) 0.00))))
)

;Problem #4

(define (insert elem tree)
    (if (null? tree)
        (list elem '() '())
        (if (< elem (car tree))
            (list (car tree) (insert elem (car(cdr tree))) (car(cdr(cdr tree))))
            (list (car tree) (car(cdr tree)) (insert elem (car(cdr(cdr tree)))))
        )
    )
)