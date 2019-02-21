#lang racket

(define (EvenOrOdd x)
(if (= (remainder (length x) 2) 0)
        (car x)
        (car (reverse x))
    )
)


(EvenOrOdd '(1 2 3))
(EvenOrOdd '(1 2 3 4))


(define (ThirdElement x)
(if (>=  (length x) 3)
        (list-ref x 2)
        '()
    )
)

(ThirdElement '(1 2 3 4))
(ThirdElement '(1))

(define (ThreeArgumentsToList x y z)
    (cons x (cons y (cons z '())))
)

(ThreeArgumentsToList '(1) 2 '(3 5 6 7))

(define (Palindrome x)
    (equal? (string->list x) (reverse (string->list x)))
)

(Palindrome "123")
(Palindrome "12321")


(define (toF z)
    (equal? (remainder(z 2)) 0)
)

(define (imprimeImpar x y)
  (if (null? x)
    x
    (if y 
      (imprimeImpar (cdr x) #f) 
      (cons (car x) (imprimeImpar (cdr x) #t))
    )
  )
)

(imprimeImpar '(1 2 3) #t)
(imprimeImpar '(1 2 3 4 5 6 7 8 9) #t)
(imprimeImpar '(0 1 2 3 4 5 6 7 8 9) #t)

