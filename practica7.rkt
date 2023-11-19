;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname practica7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; practica 7
(define CARAS 6)

;; simular-dado: Natural -> List(Natural)
;; simular-dado utiliza recursion para generar una lista de "n" numeros entre 1 y 6, donde cada número se agrega a la lista acumulada a medida que se realizan las llamadas recursivas.
(define (simular-dado n)
  (cond[(zero? n) '()] ; caso base: si "n" es cero, devuelve una lista vacia
       [else (append (simular-dado (sub1 n)) (list (random CARAS)))]))

(define MAX 60)
(define EXPERIMENTO (simular-dado MAX))
(define VALORES (list 1 2 3 4 5 6))

;; frecuencia : Natural List(Natural) -> Natural
;; frecuencia busca la aparición de un número n en una lista y cuenta cuántas veces aparece, utilizando la recursión para procesar todos los elementos de la lista.
(check-expect (frecuencia 2 '(1 2 3 4 2 4 2)) 3)
(check-expect (frecuencia 4 '(1 2 3 4 5 6 4 6 7 8 4 5 4)) 4)
(define (frecuencia n l)
  (cond
    [(empty? l) 0]  ; Caso base: si la lista está vacía, la frecuencia es 0
    [(= (first l) n) (add1 (frecuencia n (rest l)))]  ; Si el primer elemento de la lista es igual a n, incrementa la frecuencia y recursivamente verifica el resto de la lista
    [else (frecuencia n (rest l))]  ; Si el primer elemento no es igual a n, verifica el resto de la lista
  )
)

;; frecuencia-relativa : Natural List(Natural) -> Number
;; puedo calcular la frecuencia relativa de un valor en una lista, o sea, la proporción de veces que aparece
(check-expect (frecuencia-relativa 3 '(1 2 3 3 4 3)) 0.5)
(define (frecuencia-relativa n l) (/  (frecuencia n l) (length l)))

;; frec-rel-exp : Natural -> Number
;; La función frec-rel-exp nos devuelve la frecuencia relativa de un valor en nuestro EXPERIMENTO:
(check-expect (frec-rel-exp 10) 0)
(define (frec-rel-exp n) (frecuencia-relativa n EXPERIMENTO))

(define FRECUENCIAS-RELATIVAS (map frec-rel-exp VALORES))

