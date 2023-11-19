;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;---------- PRACTICA 5 / LISTAS --------------------

; Problema: calcualar el promedio de una lista de numeros
(define LISTA1 (list 7 3 8 10 0))
(define LISTA2 (list 100 300 200))
(define LISTA3 (list -2 2 -1 1))
(define LISTA4 (list 1 2 3 4 5 6 7 8 9))

; suma : List(Number) -> Number
; dada una lista de numeros devuelve su suma
(check-expect (suma empty) 0)
(check-expect (suma LISTA1) 28)
(check-expect (suma LISTA4) 45)
(define
  (suma l)
  (cond [(empty? l) 0]
        [(cons? l) (+ (first l) (suma (rest l)))]
        ))

; cantidad : List(Number) -> Number
; dadad una lista de numeros, devuelve la cantidad de elementos que la conforman
(check-expect (cantidad empty) 0)
(check-expect (cantidad LISTA2) 3)
(check-expect (cantidad LISTA3) 4)
(check-expect (cantidad LISTA4) 9)
(define
  (cantidad l)
  (cond[(empty? l) 0]
       [(cons? l) (+ 1 (cantidad (rest l)))]))

; promedio : List(Number) -> Number
; dada una lista de numeros devuelve su promedio
(check-expect (promedio empty) 0)
(check-expect (promedio LISTA1) 5.6)
(check-expect (promedio LISTA4) 5)
(check-expect (promedio LISTA2) 200)
(define
  (promedio l)
  (cond [(empty? l) 0]
        [else (/ (suma l) (cantidad l))]
        ))




;-------------------------------------
;Ud. se encuentra trabajando sobre la lista de contactos de un nuevo teléfono. El dueño del teléfono puede agregar y borrar nombres y consultar esta lista para cualquier nombre. Pensemos que a Ud. se la ha asignado la tarea de diseñar la función que toma la lista de contactos y determina si contiene el nombre "Marcos"
; contiene-Marcos? : Contactos -> Booleano
; dada una lista de Contactos, determina si "Marcos" es un elemento de la misma
(check-expect (contiene-Marcos? empty) #false)
(check-expect (contiene-Marcos? (cons "Sara" (cons "Pedro" '()))) #false)
(check-expect (contiene-Marcos? (cons "A" (cons "Marcos" (cons "C" '())))) #true)
(check-expect (contiene-Marcos? (cons "Juan" '())) #false)
(check-expect (contiene-Marcos? (cons "Marcos" '())) #true)
(define
  (contiene-Marcos? l)
  (cond[(empty? l) #false]
       [(cons? l) (if (string=? (first l) "Marcos")
                      #true
                      (contiene-Marcos? (rest l)))
                      ]))



; Ejercicio 5: Diseñe la función contiene? que determine si un string aparece en una lista de string.
; contiene? : String -> Booleano
; dado un string determina si otro string aparece en la misma lista
(check-expect (contiene? "Marcos" (cons "Juan" '())) #false)
(check-expect (contiene? "Marcos" (cons "Eugenia"
  (cons "Lucía"
    (cons "Dante"
      (cons "Federico"
        (cons "Marcos"
          (cons "Gabina"
            (cons "Laura"
              (cons "Pamela" '()))))))))) #t)
(define
  (contiene? x l)
  (cond[(empty? l) #false]
       [(cons? l) (if (string=? (first l) x)
                      #true
                      (contiene? x (rest l)))]))

; Ejercicio 7
(define LISTA-MONTO1 (list 1 2 3 4))
(define LISTA-MONTO2 (list 10 100 40 50))
(define LISTA-MONTO3 (list 30 30 30 50))
; suma : List(Number) -> Number
; suma toma lista de numeros y devuelve el resultado de la suma de dichos numeros

(check-expect (suma7 empty) 0)
(check-expect (suma7 LISTA-MONTO1) 10)
(check-expect (suma7 LISTA-MONTO2) 200)
(check-expect (suma7 LISTA-MONTO3) 140)
(define
  (suma7 l)
  (cond[(empty? l) 0]
       [(cons? l) (+ (first l) (suma7 (rest l)))]))

;-----------------------

; Ejercicio 8
; pos?: List(Number) -> Boolean
; pos? evalua a #t si todos los numeros son positivos
; de lo contrario, devuele #f

(check-expect (pos? empty) #t)
(check-expect (pos? (list 1 10 6 4)) #t)
(check-expect (pos? (list 1 -3 6 0)) #f)

(define
  (pos? l)
  (cond
    [(empty? l) #t]
    [(cons? l)
     (and (> (first l) 0)
          (pos? (rest l)))]))

;------------------------------------

; Ejercicio 9
; todos-verdaderos : List(Booleano) -> Booleano
; todos-verdaderos recibe una lista de valores booleanos, si todos son #true, devuelve #true. De lo contrario, devuelve #false
(define LISTA-V1 (list #t #t #t))
(define LISTA-V2 (list (< 2 3) (> 5 1) (> 6 3)))
(define LISTA-V3 (list #t #f #t))
(check-expect (todos-verdaderos empty) #t)
(check-expect (todos-verdaderos LISTA-V1) #t)
(check-expect (todos-verdaderos LISTA-V2) #t)
(check-expect (todos-verdaderos LISTA-V3) #f)
(define
  (todos-verdaderos l)
  (cond[(empty? l) #t]
       [(cons? l)  (if (first l) (todos-verdaderos (rest l)) #false)]))

;-------------------------
; Ejercicio 9
; uno-verdadero : List(Booleano) -> Booleano
; uno-verdadero recibe una lista de booleanos y si al menos UNO es verdadero, devuelve #t. De lo contrario, devuelve #f
(define LISTA-F1 (list #t #t #t))
(define LISTA-F2 (list (< 2 3) (> 1 5) (> 6 3)))
(define LISTA-F3 (list #f #f #t))
(define LISTA-F4 (list #f #f #f))
(check-expect (uno-verdadero empty) #f)
(check-expect (uno-verdadero LISTA-F1) #t)
(check-expect (uno-verdadero LISTA-F2) #t)
(check-expect (uno-verdadero LISTA-F3) #t)
(check-expect (uno-verdadero LISTA-F4) #f)
(define
  (uno-verdadero l)
  (cond [(empty? l) #f]
        [(cons? l) (if (first l) #t (uno-verdadero (rest l)) )]))

;------------------------------------------------------------------

;Ejercicio 10
; cant-elementos : List(Any) -> Number
; dada una lista de elementos cualesquiera, va a devolver la cantidad de elementos que contiene
(define LISTA-VOCABULARIO (list "a" "e" "i" "o" "u"))
(define LISTA-NUM (list 1 2 3 4))
(define LISTA-FRUTAS (list "manzana" "pera" "banana"))
(define LISTA-BOOL (list #t #t #f #t))
(check-expect (cant-elementos LISTA-VOCABULARIO) 5)
(check-expect (cant-elementos LISTA-NUM) 4)
(check-expect (cant-elementos LISTA-FRUTAS) 3)
(check-expect (cant-elementos LISTA-BOOL) 4)
(define
  (cant-elementos l)
  (cond [(empty? l) 0]
        [(cons? l) (+ 1 (cant-elementos  (rest l)))]))

;-----------------

;Ejercicio 12
; pares : List(Number) -> Number
; pares recibe una lista de numeros y devuelve sus pares
(check-expect (pares '()) '())
(check-expect (pares (list 4 6 3 7 5 0)) '(4 6 0))

(define (pares l) (cond [(empty? l) '()]
                        [(cons? l) (if (= (modulo (first l) 2) 0)
                                       (cons (first l) (pares (rest l)))
                                       (pares (rest l)))]))
;------------------
; Ejercicio 13
; cortas : List(String) -> String
; dada una lista de string devuelve aquellas palabras que son menores a 5
(check-expect (cortas empty) '())
(check-expect (cortas '( "Lista" "de" "palabras" "sin" "sentido")) (list "de" "sin"))
(check-expect (cortas '("sandwich" "de" "jamon" "y" "queso")) (list "de" "y"))
(define
  (cortas l)
  (cond [(empty? l) '()]
        [(cons? l) (if (< (string-length (first l)) 5)
                                        (cons (first l) (cortas (rest l)))
                                        (cortas (rest l)))]))
;---------------------
;Ejercicio 14
; mayores : List(Number) -> Number
; mayores recibe una lista de numeros n y l y devuelve aquellos elementos l que son mayores a n
;(check-expect (mayores empty) '())
(check-expect (mayores '( "Lista" "de" "palabras" "sin" "sentido") 5) (list "palabras" "sentido"))
(define
  (mayores l n)
  (cond[(empty? l) '()]
       [(cons? l) (if (> (string-length (first l)) n)
                      (cons (first l) (mayores (rest l) n))
                      (mayores (rest l) n))]))
;--------------------------------
; Ejercicio 15
; cerca: List(Posn) -> Posn
; cerca toma una lista de puntos en el plano y devuelve una lista de aquellos puntos
; que estan a una distancia menor a MAX de origen
(define MAX 5)
(define L1 (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6)))
(define L2 (list (make-posn 2 3) (make-posn 5 6) (make-posn 4 5)))

(check-expect (cerca L1) (list (make-posn 1 2) (make-posn 0 1)))


(define (cerca l)
  (cond [(empty? l) '()]
        [(cons? l)  (if (< (sqrt (+ (expt (posn-x (first l)) 2) (expt (posn-y (first l)) 2))) MAX)
                                       (cons (first l) (cerca (rest l)))
                                       (cerca (rest l)))]))

;--------------------------
;Ejercicio 16
; positivos : List(Number) -> Number
; positivos toma una lista de numeros y devuelve aquellos que son mayores a 0
(check-expect (positivos (list -5 37 -23 0 12)) (list 37 12))

(define
  (positivos l)
   (cond[(empty? l) '()]
        [(cons? l)  (if (> (first l) 0)
                                           (cons (first l) (positivos (rest l)))
                                           (positivos (rest l)))]))



;_-------------------



;ejercicio 17
(check-expect (eliminar (list 1 2 3 2 7 6) 2) (list 1 3 7 6))
(check-expect (eliminar (list 1 2 3 2 7 6) 0) (list 1 2 3 2 7 6))
(define (eliminar l n) (cond [(empty? l) '()]
                             [(cons? l) (if (= (first l) n)
                                            (eliminar (rest l) n)
                                            (cons (first l) (eliminar (rest l) n)))]))





;-------- ejercicio 18 --------------
(check-expect (raices (list 9 16 4)) '(3 4 2))
(define (raices l) (map sqrt l))