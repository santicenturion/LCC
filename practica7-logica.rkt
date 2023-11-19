;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname practica7-logica) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(check-expect (implica #f #f) #t)
(check-expect (implica #f #t) #t)
(check-expect (implica #t #f) #f)
(check-expect (implica #t #t) #t)
(define (implica p q) (or (not p) q))

(check-expect (equivalente #f #f) #t)
(check-expect (equivalente #f #t) #f)
(check-expect (equivalente #t #f) #f)
(check-expect (equivalente #t #t) #t)
(define (equivalente p q) (and (implica p q) (implica q p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; agregar-true : List(Boolean) -> List(Boolean)
(define (agregar-true l) (cons #t l))

; agregar-false : List(Boolean) -> List(Boolean)
(define (agregar-false l) (cons #f l))

; valuaciones : Natural -> List(Boolean)
(define (valuaciones n) (cond [(zero? n) '()]
                              [(= n 1) (list (list #false) (list #true))]
                              [else (append (map agregar-false (valuaciones (sub1 n)))
                                            (map agregar-true (valuaciones (sub1 n))))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (A l) (let ([p1 (first l)]
                    [p2 (second l)]
                    [p3 (third l)])
                (equivalente (and (implica p1 p3)
                                  (implica p2 p3))
                             (implica (or p1 p2)
                                      p3))))

(define (B l) (let ([p1 (first l)]
                    [p2 (second l)]
                    [p3 (third l)])
                (equivalente (implica (and p1 p2)
                                      p3)
                             (and (implica p1 p3)
                                  (implica p2 p3)))))

(define (C l) (let ([p1 (first l)]
                    [p2 (second l)])
                (equivalente (or (not p1) (not p2))
                             (and p1 p2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; evaluar (List(Boolean) -> Boolean) Natural -> List(Boolean)
(define (evaluar P n) (map P (valuaciones n)))

(check-expect (evaluar A 3) (list #true #true #true #true #true #true #true #true))
(check-expect (evaluar B 3) (list #true #true #false #true #false #true #true #true))
(check-expect (evaluar C 2) (list #false #false #false #false))