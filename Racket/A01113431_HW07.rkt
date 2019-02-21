#lang racket

;; Complete the following functions and submit your file to Blackboard.

;; ========= IMPORTANT ==========
;; Change the name of the file so that it contains your student ID or name.
;; Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
;; Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
;; Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
;; If your file cannot be loaded by the Racket interpreted, your grade will be zero. Then, submit only code that works.

(define (exist? x lst)
  	(if (null? lst)
        #f
        (if (equal? (car lst) x)
            #t
            (exist? x (cdr lst))
        )
    )
)

(define (index x lst)
    (if (exist? x lst)
        (if (null? lst)
            -1
            (if (equal? (car lst) x)
                0
                (+ (index x (cdr lst)) 1)
            )
        )
        -1
    )
)

(define (allDifferent? lst)
    (if (null? lst)
        #t      
        (if (exist? (car lst) (cdr lst))
            #f
            (allDifferent? (cdr lst))
        )
    )
)

(define (set x)
    (remove-duplicates (removeNonNumbers x))
)

(define (union x y)
	(set (append x y))
)

(define (intersect x y)
  	(set (sameElements x y))
)

(define (det3x3 m)
	(- (+ (* (elementInXY 0 0 m) (elementInXY 1 1 m) (elementInXY 2 2 m)) (* (elementInXY 0 1 m) (elementInXY 1 2 m) (elementInXY 2 0 m)) (* (elementInXY 0 2 m) (elementInXY 1 0 m) (elementInXY 2 1 m))) (+ (* (elementInXY 2 0 m) (elementInXY 1 1 m) (elementInXY 0 2 m)) (* (elementInXY 2 1 m) (elementInXY 1 2 m) (elementInXY 0 0 m)) (* (elementInXY 2 2 m) (elementInXY 1 0 m) (elementInXY 0 1 m))))
)

(define (removeNonNumbers x)
    (if (null? x)
        '()
        (if (number? (car x))
            (cons (car x) (removeNonNumbers (cdr x)))
            (removeNonNumbers (cdr x))
        )
    )
)

(define (sameElements x y)
    (if (null? x)
        '()
        (if (exist? (car x) y)
            (cons (car x) (sameElements (cdr x) y))
            (sameElements (cdr x) y)
        )
    )
)

(define (elementInXY x y mat)
    (list-ref (list-ref mat y) x)
)