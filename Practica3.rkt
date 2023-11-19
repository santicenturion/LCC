;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;------------------------------------------------- PRACTICA 3 -------------------------------------------
; ------------------------------------------------- PROGRAMAS INTERACTIVOS ----------------------------

; EJEMPLO
; Estado es un string, que representa el color del círculo a dibujar en pantalla.
; Posibles valores:
; - "blue"
; - "red"
; - "green"
;definimos constantes que se van a poder utilizar

; interpretar: Estado -> Image
; dado un estado, devuelve la imagen a mostrar por el programa
; (omitimos los ejemplos para faciltar la legibilidad)
;interpretar: Estado -> Image
(define (interpretar s)
  (place-image (circle 10 "solid" s) 100 100
               (empty-scene 200 200)))

;manejarTeclado: Estado String -> Estado
(define (manejarTeclado s k)
  (cond[(key=? k "a") "blue"]
       [(key=? k "r") "red"]
       [(key=? k "v") "green"]
       [(key=? k "n") "black"]
       [else s]))

#|(big-bang "blue"
  [to-draw interpretar]
  [on-key manejarTeclado])|#


;Ejercicio 2. Escriba un programa que dibuje un círculo color azul de radio 100 el cual vaya disminuyendo su tamaño con el paso del tiempo (es decir, con cada tick del reloj).

;Interpretar; Number -> Image 
;Transforma el estado del sistema a una imagen a través de la clausula to-draw
(define
  (pantalla n)
  (place-image (circle n "solid" "blue") 150 150 (empty-scene 300 300)))

;Decrementar:Number -> Number
; Devuelve el predecesor de un número positivo
; Si el número es 0, devuelve 100
(define (decrementar n) (cond [(> n 0) (- n 1) ]
                              [(= n 0) 100]))


;Estado inicial
#|(big-bang 100
  [to-draw pantalla]
  [on-tick decrementar])|#

;Ejercicio 3. Asumiendo que ya realizó las actividades propuestas en el Ejercicio 2, se pide que realice las siguientes modificaciones

;Modifique la función incrementar para que incremente en 1 el estado actual sólo si el círculo resultante cabe completamente en la pantalla. En caso contrario, que devuelva 0 como nuevo estado.
; incrementar : Number -> Number
; Incrementar suma uno a su argumento
(define (incrementar n)   (if (> n 212) 0 (+ n 1)))
;Recibe number y string
;devuelve circle 
(define
  (dibujar n c)
  (place-image (circle n "solid" c) 150 150 (empty-scene 300 300)))

;Para cada n mayor o igual al numero asignado, devuelve el color asignado
(define (pantalla_nueva n) (cond[(<= n 50) (dibujar n "yellow")]
                                [(<= n 100) (dibujar n "red")]
                                [(> n 100) (dibujar n "green")]))
;Si la tecla presionada es un dígito d, entonces el nuevo estado debe ser 10*d,

;Para cualquier otra tecla, deja el estado sin cambiar.
(define (manejarTeclado2 s k)
  (if (number? (string->number k)) (* 10 (string->number k)) s))

;la funcion sirve para que el programa finalice si es mayor a 110 o menor a 10
(define (condicion s)
  (or (< s 10) (> s 110)))

#|(big-bang 40
  [to-draw pantalla_nueva]
  [on-tick incrementar]
  [on-key manejarTeclado2]
  [stop-when condicion])|#


;Ejercicio 4. En este ejercicio moveremos un objeto verticalmente sobre una escena. El estado del sistema será un número, que representa la posición vertical sobre la que se va a dibujar un círculo. Defina constantes para representar el ancho y alto de la escena, así como también el radio inicial del círculo. Genere una expresión big-bang tal que:
(define ANCHO 300)
(define ALTO 300)
(define RADIO_INICIAL 15)
(define DELTA 3)


(define (initial n)
  (place-image (circle RADIO_INICIAL "solid" "blue")
               (/ ANCHO 2) n
               (empty-scene ANCHO ALTO)))

(define (tec s k)
  (cond [(key=? k "up") (if (> (- s DELTA) (/ RADIO_INICIAL 2)) (- s DELTA) s)]
        [(key=? k "down") (if (> (+ s DELTA) (- ALTO (/ RADIO_INICIAL 2))) (+ s DELTA) s)]
        [(key=? k " ") (/ ALTO 2)]
        [else s]))

(define (mouse-handler n x y event)
  (cond [(string=? event "button-down") y]
        [else n]))
#|(big-bang (/ ALTO 2)
  [to-draw initial]
  [on-key tec]
  [on-mouse mouse-handler])|#


;Ejercicio 5. Este programa comienza con el fondo de color blanco y un círculo en el centro de la escena. A medida que pasen los ticks del reloj irá cambiando el color del círculo central. Pasará por los siguientes colores: amarillo, rojo, verde y azul, en el orden presentado
(define TIEMPO_EJECUCION 1)

(define (initial2 c)
  (place-image (circle 10 "solid" c) 150 150
               (empty-scene ANCHO ALTO "white")))
 ;Pasará por los siguientes colores: amarillo, rojo, verde y azul, en el orden presentado.
(define (color2 s) (cond[(string=? s "yellow") "red"]
                       [(string=? s "red") "green"]
                       [(string=? s "green") "blue"]
                       [(string=? s "blue") "yellow"]))

;El estado inicial del sistema sea: color amarillo.

;La función que responde a la cláusula to-draw debe dibujar el círculo del color indicado en el estado en el centro de la escena.

;Cada tick del reloj modifica el color guardado en el estado. Dicho estado debe respetar la siguiente secuencia: amarillo, rojo, verde, azul y vuelve a comenzar la secuencia pasando al amarillo.  

#|(big-bang "yellow"
  [to-draw initial2]
  [on-tick color2 TIEMPO_EJECUCION])|#


;;;;;;;;;;;;;;;;;;;;;;;;;,Ejercicio 6.
; Estado del sistema: Una string vacía que representa que todavía no hay nada escrito.
(define ALTO1 800)
(define ANCHO1 80)
; Estado inicial
(define INICIAL "")
; escena vacía:
(define FONDO (empty-scene ANCHO1 ALTO1))
; pantalla : Estado -> Imagen
; dado un estado s, dibuja un texto que representa la cadena de caracteres
; dada por s.
(define (pantalla3 s) (place-image/align (text s 20 "indigo") 0 0 "left" "top" FONDO))
; agregar-letra : Estado String -> Estado
; Dado una tecla, concatena esta a la cadena que ya habíamos escrito hasta ahora.
(check-expect (agregar2 "" "a") "a")
(check-expect (agregar2 "hola mund" "o") "hola mundo")
(check-expect (agregar2 "racke" "t") "racket")
(define (agregar-letra s k) (string-append s k))

; agregar-letra-con-borrado : Estado String -> Estado
; Dado una tecla, concatena esta a la cadena que ya habíamos escrito hasta ahora.
(check-expect (agregar-letra-con-borrado "" "a") "a")
(check-expect (agregar-letra-con-borrado "hola mund" "o") "hola mundo")
(check-expect (agregar-letra-con-borrado "racke" "t") "racket")
(check-expect (agregar-letra-con-borrado "" "\b") "")
(check-expect (agregar-letra-con-borrado "hola mundo" "\b") "hola mund")
(define (agregar-letra-con-borrado s k)
(cond [(key=? "\b" k) (if (> (string-length s) 0)
(substring s 0 (- (string-length s) 1))
s)]
[else (agregar-letra s k)]))
; Expresión Big-Bang
#|(big-bang INICIAL
[to-draw pantalla3]
[on-key agregar-letra-con-borrado])|#


;TRIANGULO - ROTATIVO
;definimos constantes
(define ANCHO3 1000)
(define ALTO3 1000)
(define FONDO3 (empty-scene ANCHO ALTO "black"))
(define COLOR-PAR "blue")
(define COLOR-IMPAR "green")

;determinar-color: Number -> String
;determinar-color retorna un color dependiendo de si el angulo que recibe es par o impar
(check-expect (determinar-color 2) COLOR-PAR)
(check-expect (determinar-color 23) COLOR-IMPAR)
(define (determinar-color r) (if (even? r) COLOR-PAR COLOR-IMPAR))

;estado inicial, angulo nulo
(define INIT 0)

;pantalla es la funcion dedicada a la clausula to-draw
;pantalla: Estado -> Imagen
; pantalla lo que hace es dibujar un triangulo en el centro de una escena negra,
;el color del triangulo depende del grado de rotacion
;el grado de rotacion depende del estado
(define (pantalla5 r) (place-image(rotate r (triangle 50 "solid" (determinar-color r))) (/ ANCHO3 2) (/ ALTO3 2) FONDO3))


;mouse-handler es el handler indicado ala clausula on-mouse de la expresion big-bNG
;mouse-handler: Estado Number Number MouseEvent -> Estado
(check-expect (mouse-handler1 2345 1 1 "button-down") 0)
(check-expect (mouse-handler1 2345 1 1 "button-up") 2345)
(define (mouse-handler1 r x y e) (if (mouse=? e "button-down") INIT r))


;Incrrementar es el handler indicado a la clausula on-tick de la expresion big-bang
;Incrementar: Estado -> Estado
(check-expect (incrementar5 30) 35)
(check-expect (incrementar5 0) 5)
(define (incrementar5 r) (+ r 5))





;expresión big-bang
(big-bang INIT
  [to-draw pantalla5]
  [on-mouse mouse-handler1]
  [on-tick incrementar5 0.2])