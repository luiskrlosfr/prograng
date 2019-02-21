#lang racket

; Problem #9
(define (matrixSum x)
	(if (null? x)
		0
		(if (list? (car x))
			(+ (matrixSum (car x)) (matrixSum (cdr x)))
			(+ (car x) (matrixSum (cdr x)))
		)
	)		
)

(matrixSum '((1 2 3) (4 5 6) (7 8 9)))

; Problem #6
(define (orFunc listX listY)
    (if (null? listX)
        '()
        (if (> (+ (car listX) (car listY)) 0)
            (cons 1 (orFunc (cdr listX) (cdr listY)))
            (cons 0 (orFunc (cdr listX) (cdr listY)))
        )
    )
)

(orFunc '(1 1 1) '(0 1 0))
(orFunc '(1 0 1 0 1) '(1 1 1 0 0))

; Problem #2

(define (countDigit x)
    (if (null? x)
        0
        (if (> (/ (car x) 10) 0)
        (+ 1 (countDigit (cons (round (/ (car x) 10)) (cdr x))))
        (+ 0 (countDigit (cdr x)))
        )
    )
)

(countDigit '(111 22 3))

; Problem #3

(define (sum x)
	(if (null? x)
		0
		(if (list? (car x))
			(+ 0 (sum (cdr x)))
			(+ (car x) (sum (cdr x)))
		)
	)
)

(define (advancedMean x)
    (if (null? x)
        (cons (read) (advancedMean x))
        (if (equal? (car x) 0)
            (/ (sum x) (length x))
            (cons (read) (advancedMean x))
        )
    )
)

(advancedMean '())