;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Practica6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; --------------- PRACTICA 6 -----------------

; copiar: Natural String -> Lista(String) 
; El propósito de la función copiar es crear una lista de
; n copias de una cadena s
 
(check-expect (copiar 2 "hola") (list "hola" "hola"))
(check-expect (copiar 0 "hola") '())
(check-expect (copiar 4 "abc") (list "abc" "abc" "abc" "abc"))

(define (copiar n s) (cond [(zero? n) '()]
                           [(positive? n) (cons s (copiar (sub1 n) s))]))

;; Ejercicio 1
;; sumanat : Natural Natural -> Natural
;; dado dos numeros naturales devuelve un natural que es la suma de ambos
(check-expect (sumanat 1 2) 3)
(check-expect (sumanat 6 6) 12)
(define (sumanat a b)
  (cond [(zero? b) a]
        [(positive? a) (sumanat (add1 a) (sub1 b))]))

;; Ejercicio 2
;; multiplicar : Natural Natural -> Natural
;; multiplicar toma dos numeros naturales y multiplica devolviendo su resultado
(check-expect (multiplicar 3 2) 6)
(check-expect (multiplicar 3 3) 9)
(define (multiplicar a b)
  (cond [(zero? b) 0]
        [else (sumanat a (multiplicar a (sub1 b)))]))


;; Ejercicion 3
;; powernat : Natural Natural -> Natural
;;  toma dos números naturales y devuelve el resultado de elevar el primero a la potencia del segundo
(check-expect (powernat 4 2) 16)
(check-expect (powernat 2 2) 4)
(check-expect (powernat 5 3) 125)
(define (powernat a b)
  (cond [(zero? b) 1]
        [else (multiplicar a (powernat a (sub1 b)))]))

;; Ejercicio 4
;; sigma: Natural (Natural -> Number) -> Number
;; dados un número natural n y una función f, devuelve la sumatoria de f para los valores de 0 hasta n
;(check-expect (sigma 4 sqr) 30)
;(check-expect (sigma 10 identity) 55)
;(define (sigma a b)
 ; (cond [(zero? b) ]
  ;      []))


;; Ejercicio 5
;; intervalo: dado un número natural n, devuelve la lista (list 1 2 ... n). Para 0 devuelve '()
(check-expect (intervalo 4) (list 1 2 3 4))
(define (intervalo n) (cond [(zero? n) '()]
                            [(positive? n) (sort (cons n (intervalo (- n 1))) <)]))

;; Ejercicio 8
; Funcion fibonacci
; fibnat: Number -> Natural
(check-expect (fibnat 0) 1)
(check-expect (fibnat 1) 1)
(check-expect (fibnat 2) 2)
(check-expect (fibnat 3) 3)
(check-expect (fibnat 4) 5)
(check-expect (fibnat 5) 8)
(define (fibnat n)
  (cond
    [(zero? n) 1]
    [(zero? (sub1 n)) 1]
    [else (+
           (fibnat (sub1 n))
           (fibnat (sub1 (sub1 n))))]))


;; Ejercicio 9
; list-fibonacci: Number -> List(Natural)
(check-expect (list-fibonacci 4)
              (list 5 3 2 1 1))
(check-expect (list-fibonacci 0)
              (list 1))
(define (list-fibonacci n)
  (cond
    [(zero? n) (list 1)]
    [else
     (cons (fibnat n) (list-fibonacci (sub1 n)))]))



;; Ejercicio 10
;; toma un número natural y devuelve su factorial. El factorial de un número natural n se calcula haciendo 1 x 2 x ... x n. Use el evaluador paso a paso para evaluar (factnat 4)
;; facnat: Natural -> Natural
(check-expect (factnat 5) 120)
(check-expect (factnat 4) 24)
(define (factnat n) (cond [(zero? n) 1]
                          [(positive? n) (multiplicar n (factnat (sub1 n)))]))
















