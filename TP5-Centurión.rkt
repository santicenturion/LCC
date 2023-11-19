;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Trabajo-Final) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
;;#reader(lib "htdp-advanced-reader.ss" "lang")((modname TP-T2-Apellido1-Apellido2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
#| Trabajo Práctico Final - Tema 2

Integrantes:
- [Centurión, Santiago]
|#

;;;;;;;; Ejercicio 1
;; MAZO-ORDENADO será la constante utilizada durante el programa para simular un mazo de cartas
;; La consigna nombraba hacer una lista de 0 a N pero, no existe una carta 0, por ende mi lista empezara desde el numero natural 1
(define MAZO-ORDENADO (list 1 2 3 4 5 6 7))

;------------------------------------------------------------------

;;;;;;;; Ejercicio 2

;; shuffle recibe una lista ordenada de naturales y la desordena de manera aleatoria, de esta forma cumple con la consigna de "barajar" que simula ser la persona que da las cartas.
;; shuffle: List(Naturales) -> List(Naturales)
(define (shuffle l n)
  ;; En shuffle me encontre con el problema de que necesitaba una funcion a la cual poder encontrar un numero random dentro de la lista, por eso encontre la solución a elegir un local y dentro agrgar "random".
  ;; random me va a generar números aleatorios de [0, n), por lo que agrego 1 y aseguro que "x" esté dentro del rango de [1, n)
  (local [(define x (random (+ 1 n)))] ; Resumidamente: mi función local va a elegir un natural aleatorio. Entre [1,n), seria x

    (cond
      
      [(empty? l) '()] ;; Caso base de recursión.
      
      ;; En el siguiente caso, si el número aleatorio "x" no esta presente en "l",
      ;; realizo una recursión a shuffle con la misma lista "l" y el mismo valor, en este caso "n"
      ;; Esto me asegura de que se elija un número aleatorio diferente en la siguiente iteración

      [(not (member? x l)) (shuffle l n)];; Resumidamente: Si x esta en la lista, que haga
                                         ;; la siguiente ley

      ;; En el caso contrario, cuando "x" este dentro de "l", utilizo "cons" para agregar justamente "x" al principio de la lista que devuelve.
      ;; Luego, realizo una recursividad a shuffle con la lista "l" sin el elemento "x" (remove) y el mismo valor n.
      ;; Esto lo hago para que se continue barajando el resto de los elementos de la lista.
      
      [else (cons x (shuffle (remove x l) n))] ;; Va a construir una lista, poniendo el aleatorio
                                               ;; como primer elemento y hace recursión
        )
    )
)

;----------------------------------------------------------------------------------------------

;;;;;;;; Ejercicio 3
;; crear-cartas: Number -> List(Number)
;; crear-cartas es una funcion auxiliar que me permite crear una lista de numeros hasta el numero que le asigne a "n"
;; crear-cartas me ayudará para hacer recursión en mi función jugar.
(define (crear-cartas n) (cond [(zero? n) '()] ;; Caso base: cuando n llega a 0 devuelve '()
                               [else (append (crear-cartas (sub1 n)) (list n))]))


;; jugar: Number -> List(Number)
;; jugar recibe un número y devuelve una lista desordenada de n elementos de mazos desordenados
;; jugar se encarga de jugar al juego "Nada en su lugar" 'n' veces. Cada que se llama a la funcion "jugar" se baraja un mazo de cartas del 1 al 7 y se agrega a la lista de resultados.
;; El proceso se repite "n" veces, hasta que "n" alcanza cero y ahí devuelve una lista vacía.
(define (jugar n)
  (cond [(zero? n) '()] ;; Caso base: cuando n llega a 0 devuelve '()
        
        ;; Si "n" es distinto de cero, se ejecuta la siguiente rama del cond.
        ;; En este instante se realiza una recursividad a la funcion de jugar con n decrementando en 1 (sub1 n).
        ;; Esto me asegura que jugar se llame nuevamente con un valor más pequeño en cada iteración, acercandose al caso base.
        ;; Luego, llamo a shuffle con "crear-cartas", esto me genera un mazo desordenado utilizando a justamente "crear-cartas" para generar una lista de cartas del 1 al 7, luego, se baraja utilizando shuffle.
        ;; Por último con "con" agrego un mazo desordenado resultante al principio de la lista que se esta construyendo mediante la recursividad.
        [else (cons (shuffle (crear-cartas 7) 7) (jugar (sub1 n)))]))


;------------------------------------------------------------------------------------------


;;;;;;;; Ejercicio 4
;; perdedora? : List(Number) -> Boolean
;; perdedora? recorre una lista y verifica si contiene algún elemento igual a pos. Si encuentra un elemento igual, devuelve #true, indicando que la lista es perdedora. Si la lista está vacía o no contiene ningún elemento igual a pos, devuelve #false, indicando que la lista no es perdedora.
(check-expect (perdedora? '(3 6 7 1 5 4 2) 1) #true)
(check-expect (perdedora? '(5 4 1 7 6 2 3) 1) #false)
(check-expect (perdedora? '(1 2 3 4 5 6 7) 1) #true)
(define (perdedora? l pos) (cond [(empty? l) #false] ;; Caso base: si la lista está vacía, devuelve #false
                                   [(= (first l) pos) #true] ;; Si el primer elemento de la lista es igual a pos, devuelve #true
                                   [else (perdedora? (rest l) (add1 pos))])) ;; Llamada recursiva con el resto de la lista y pos incrementado en 1

;------------------------------------------------------------------------------------------------

;;;;;;;; Ejercicio 5
;; FUNCIÓN AUXILIAR
;; valido: List(Number)-> Boolean
;; valido verifica si el juego es valido. Toma una lista l que representa un mazo desordenado y la posicion pos que se va a evaluar. Utiliza recursión para iterar sobre los elementos de la lista y compara cada elemento con la posición.
;; valido toma la misma lógica que "perdedora?" pero en el caso opuesto.
;; creo esta nueva función para que me resulte más fácil aplicarlo en el simulador y poder hacer el metodo montecarlo.
(check-expect (valido '(3 6 7 1 5 4 2) 1) #false)
(check-expect (valido '(5 4 1 7 6 2 3) 1) #true)
(define (valido l pos) (cond [(empty? l) #true]
                                   [(= (first l) pos) #false]
                                   [else (valido (rest l) (add1 pos))]))


;; simulador: Natural -> Natural
;; simulador toma un numero natural "n" y en cada simulacion genera un nuevo mazo desordenado con shuffle y crear-cartas.
;; Devuelve el contador que representa la cantidad de juegos válidos.
(define (simulador n) (cond [(zero? n) 0]
                                [else (if (valido (shuffle (crear-cartas 7) 7) 1)
                                          (+ 1 (simulador (sub1 n)))
                                          (simulador (sub1 n)))]))

;; defino la constante INTENTOS-DE-JUEGO establece la cantidad de juegos simulados que se utilizara como variable en simulador
(define INTENTOS-DE-JUEGO 1000)


;; montecarlo: calcula el porcentaje de juegos validos en la simulación utilizando la regla de tres para calcular porcentajes [(simular-juego INTENTOS-JUEGO) * 100 / INTENTOS-JUEGO].
;; Multiplico la cantidad de juegos validos por 100 y luego se divide el resultado por la cantidad total de juegos simulados. Todo esto se guarda en la variable "PORCENTAJE-JUEGO-VALIDO".
(define montecarlo (/ (* (simulador INTENTOS-DE-JUEGO) 100) INTENTOS-DE-JUEGO))
montecarlo
;; Esto devuelve
;;  aproximademente -> 36.6




;; OBSERVACIÓN:
;; Si bien le pongo montecarlo a lo ultimo, todo este ejercicio es el método montecarlo.

#| Responda a la pregunta: ¿Le conviene o no aceptar la apuesta de Lautaro?

  No le conviene aceptar a Lautaro, ya que las posibilidades de que sea un juego valido es de aproximademente un 37%.
  Por este motivo, le conviene mas jugar a Rociom ya que tiene mas posibilidades de que el juego no sea valido.


|#