;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname practica7_cesar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require racket/list)

; Practica 7 ejercicio 3



; intervalo : N N -> List(N)
; dados dos nÃomeros naturales, devuelve una lista con todos los nÃomeros entre a y b
(check-expect (intervalo 2 4) (list 2 3 4))
(check-expect (intervalo 4 4) (list 4))
(check-expect (intervalo 5 4) empty)
(define (intervalo n f)
  (cond [(> n f) '()] ;; Caso base: Si el inicio es mayor que el fin, devuelve una lista vacía.
        [else (cons n (intervalo (+ n 1) f))]))


; elimimar-multiplos: N List(N) -> List(N)
; dados un natural positivo n y una lista l, elimina todos los mÃoltiplos de n en l.
(check-expect (eliminar-multiplos 3 (list 4 6 11 15)) (list 4 11))
(check-expect (eliminar-multiplos 1 (intervalo 1 1000)) empty)
(define (eliminar-multiplos n l)
  (filter (lambda (x) (not (zero? (modulo x n)))) l))


; eratostenes : List(N) -> List(N)
; dada una lista que inicialmente es de la forma [2, .., n] para algÃon n, realiza el procedimiento de eratÃ3stenes
(check-expect (eratostenes (intervalo 2 10)) (list 2 3 5 7)) 
(check-expect (eratostenes empty) empty)
(check-expect (eratostenes (intervalo 2 17)) (list 2 3 5 7 11 13 17))
(define (eratostenes l)
  (cond [(empty? l) empty]
        [else (cons (first l) (eratostenes (eliminar-multiplos (first l) (rest l))))]))

; criba-eratostenes : N -> List(N)
; dado un natural n>=2, devuelve la lista de todos los nÃomeros primos hasta n
(check-expect (criba-eratostenes 10) (list 2 3 5 7))
(check-expect (criba-eratostenes 2) (list 2))
(check-expect (criba-eratostenes 20) (list 2 3 5 7 11 13 17 19))
 (define (criba-eratostenes n)
  (eratostenes (intervalo 2 n)))
#|

(check-expect (lista->string '(1 2 3)) "1\n2\n3\n")
(define (lista->string l) (cond [(empty? l) ""]
                                [else (string-append
                                       (number->string (first l))
                                       "\n"
                                       (lista->string (rest l)))]))


(write-file "primos.txt" (lista->string (criba-eratostenes 10000)))

;; LISTA DE PRIMOS
;; ejercicio 4
(define MAX 10000)
(define LISTA-DE-PRIMOS (read-lines "primos.txt"))

;; esprimo?: N -> bool
(define (primo m l) (if (< (string->number (first l)) (sqrt m))
                        (if (zero? (modulo m (string->number (first l))))
                           #false
                            (primo m (rest l)))
                        #true))
|#

;; CIFRADO DE CESAR

; representaremos alfabetos como Strings.
; Por ejemplo, si nuestros sÃ­mbolos son las cinco primeras letras, los dÃ­gitos y el espacio,
; lo representaremos como "ABCDE0123456789 "

; representaremos sÃ­mbolos como strings de longitud 1. En el alfabeto anterior,
; el sÃ­mbolo E lo representamos con el string "E"

; el cÃ3digo del cÃ©sar lo representaremos mediante parejas de sÃ­mbolos.
; Por ejemplo, si queremos decir que el sÃ­mbolo "A" se codifica con el
; sÃ­mbolo "C", tendremos (make-posn "A" "C") para representar esta situaciÃ3n.

;;;;;;;; Primero comenzamos definiendo algunas funciones
; sobre strings y listas que nos son de utilidad.

; partir : String -> List(String)
; dado un string, devuele una lista de strings con cada sÃ­mbolo separado
(check-expect (partir "ABC") (list "A" "B" "C"))
(check-expect (partir "12345") (list "1" "2" "3" "4" "5"))
(define (partir s)
  (map string (string->list s))) 

; tomar : List N -> List
; dada una lista y un nÃomero natural n, devuelve una lista
; con los primeros n elementos de l. Si l no tiene tantos elementos,
; con los primeros n elementos de l. Si l no tiene tantos elementos
(check-expect (tomar (list 1 2 3 4 5) 4) (list 1 2 3 4))
(check-expect (tomar (list 1 2 3 4 5) 10) (list 1 2 3 4 5))
(check-expect (tomar (list 1 2 3 4 5) 0) empty)
(define (tomar l n)
  (cond [(or (empty? l) (zero? n)) empty]
        [else (cons (first l) (tomar (rest l) (sub1 n)))]))


; otra forma es con take
;(define (tomar l n)
;  (take l n))

; tirar : List N -> List
; dada una lista y un nÃomero natural n, devuelve una lista
;  sin los primeros n elementos de l. Si l no tiene tantos elementos,
; devuelve empty.
(check-expect (tirar (list 1 2 3 4 5) 2) (list 3 4 5))
(check-expect (tirar (list 1 2 3 4 5) 10) empty)
(check-expect (tirar (list 1 2 3 4 5) 0) (list 1 2 3 4 5))
(define (tirar l n)
  (cond [(or (empty? l) (zero? n)) l]
        [else (tirar (rest l) (sub1 n))]))
;otra forma es usar drop
;(define (eliminar-primeros l n)
;  (drop l n))


; OBSERVACION: para cualquier n <= length l, (append (tomar n l) (tirar n l)) = l

; emparejar : List List -> List
; dadas dos listas [a0,..., an] y [b0, ...., bn] de la misma longitud, devuelve una lista
; de posn con parejas tomadas de ambas listas: [(make-posn a0 b0), ...., (make-posn an bn)]
(check-expect (emparejar (list 1 2) (list "a" "b")) (list (make-posn 1 "a") (make-posn 2 "b")))
(check-expect (emparejar (list #t #f) (list 1 0)) (list (make-posn #t 1) (make-posn #f 0)))
(define (emparejar l lst)
  (cond [(empty? l) empty]
        [else (cons (make-posn (first l) (first lst))
                    (emparejar (rest l) (rest lst)))]))



;;;;;;;;;;;;; Ahora comienzan las funciones especÃ­ficas para el mÃ©todo del CÃ©sar
; cifrado : N String -> List(posn)
; dada una clave de desplazamiento y un alfabeto s, devuelve una lista
; con parejas de strings, donde el primer elemento es el caracter a cifrar, y el segundo
; su cÃ3digo del CÃ©sar de acuerdo a la clave. Se asume que 0 < n < (string-length s)
(check-expect (cifrado 2 "ABC") (list (make-posn "A" "C") (make-posn "B" "A") (make-posn "C" "B"))) 
(check-expect (cifrado 1 "ABC") (list (make-posn "A" "B") (make-posn "B" "C") (make-posn "C" "A")))
; COMPLETAR (las funciones tirar, tomar, partir y emparejar le serÃ¡n de utilidad.

(define (cifrado n s)
  (emparejar (partir s)
             (append
              (tirar (partir s) (modulo n (string-length s)))
              (tomar (partir s) (modulo n (string-length s))))))




; encriptar-simbolo : String List(posn) -> String
; dado un string s de longitud 1 que es un sÃ­mbolo del
; alfabeto y una lista de parejas que representa un cÃ3digo del cÃ©sar,
; devuelve el cÃ3digo que le corresponde a s
(check-expect (encriptar-simbolo "A" (cifrado 2 "ABC")) "C")
(check-expect (encriptar-simbolo "A" (cifrado 1 "ABC")) "B")
(define (encriptar-simbolo c l)
  (cond [(empty? l) (error "No se encuentra la clave")]
        [(string=? (posn-x (first l)) c) (posn-y (first l))]
        [else (encriptar-simbolo c (rest l))]))


; encriptar-mensaje : String String Natural -> String
; dado un string, un alfabeto y una clave, devuelve el string encriptado
(check-expect (encriptar-mensaje "ABC" "ABCDEF" 3) "DEF")
(check-expect (encriptar-mensaje "ABC" "ABCDEF" 4) "EFA")
; COMPLETAR ...
(define (encriptar-mensaje s a n) (cond [(string=? s "") ""]
                                        [else (string-append
                                               (encriptar-simbolo (string-ith s 0) (cifrado n a))
                                               (encriptar-mensaje (substring s 1 (string-length s)) a n))]))



; desencriptar-simbolo : String List(posn) -> String
; dado un string s de longitud 1 que es un sÃ­mbolo del
; alfabeto y una lista de parejas que representa un cÃ3digo del cÃ©sar,
; devuelve el caracter desencriptado que le corresponde a s
(check-expect (desencriptar-simbolo "A" (cifrado 2 "ABC")) "B")
(check-expect (desencriptar-simbolo "A" (cifrado 1 "ABC")) "C")
; COMPLETAR ...
(define (desencriptar-simbolo c l)
  (cond [(empty? l) (error "No se encuentra la clave")]
        [(string=? (posn-y (first l)) c) (posn-x (first l))]
        [else (desencriptar-simbolo c (rest l))]))





; desencriptar-mensaje : String String N -> String
; dado un string, un alfabeto y una clave, devuelve el string encriptado
(check-expect (desencriptar-mensaje "DEF" "ABCDEF" 3) "ABC")
(check-expect (desencriptar-mensaje "EFA" "ABCDEF" 4) "ABC")
; COMPLETAR ...

(define (desencriptar-mensaje s a n) (cond [(string=? s "") ""]
                                        [else (string-append
                                               (desencriptar-simbolo (string-ith s 0) (cifrado n a))
                                               (desencriptar-mensaje (substring s 1 (string-length s)) a n))]))


(define ALFABETO "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ 0123456789")
(define CLAVE 3)
(define CODIGO-DEL-CESAR (cifrado CLAVE ALFABETO))

(encriptar-mensaje "HOLA" ALFABETO CLAVE)
(encriptar-mensaje "ATACAR A LAS 18" ALFABETO CLAVE)
(encriptar-mensaje "LA OPERACION ES REVERSIBLE" ALFABETO CLAVE)
(desencriptar-mensaje (encriptar-mensaje "LA OPERACION ES REVERSIBLE" ALFABETO CLAVE) ALFABETO CLAVE)


;;; ejercicio 7
(check-expect (implica #t #t) #t)
(check-expect (implica #t #f) #f)
(check-expect (implica #f  #t) #t)
(check-expect (implica #f #f) #t)
(define (implica p q) (or (not p) q))

(check-expect (equivalente #f #f) #t)
(check-expect (equivalente #f #t) #f)
(check-expect (equivalente #t #f) #f)
(check-expect (equivalente #t #t) #t)
(define (equivalente p q) (and (implica p q) (implica q p)))


;; ejercicio 8
; miverdadero(REALGFORLIFE BRRRRRRRRRRR) : List(Boolean) -> List(Boolean)
(define (miverdadero l) (cons #t l))

;; mifalso(fasojijijijiji) : List(Boolean) -> List(Boolean)
(define (mifalso l) (cons #f l))

;; valuaciones : N -> List(Boolean)
;; MIRA CAPAO ESTA PORONGA LO QUE HACE ES FUNCIONAR, O SEA VOS LE TIRAS UNA NUMERITO Y TE HACES TODAS LAS LISTAS DE IMPLICANCIA NECESARIAS 
(define (valuaciones n) (cond [(zero? n) empty]
                              [(= n 1) (list (list #false) (list #true))]
                              [else (append (map mifalso (valuaciones (sub1 n)))
                                            (map miverdadero (valuaciones (sub1 n))))]))
 