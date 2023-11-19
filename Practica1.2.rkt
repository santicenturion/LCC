;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |fabi no sabe como hacer|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;-------------------- PRÁCTICA 1 - PRIMERA PARTE -----------------------------

;---------------------Propocisiones y condicionales --------------------------
;"La palabra azul tiene más de cuatro letras."
;(> (string-length "azul") 4)

;La librería El lápiz curioso tiene una promoción para la venta de cuadernos. El precio de cada cuaderno es $60, pero comprando 4 o más realiza un 10% de descuento.
;(define
;  (precio x)
;  (if (< x 4)  (* 60 x)  (* 54 x)))



;Diremos que una imagen es angosta si su alto es mayor o igual a su ancho. Caso contrario diremos que es ancha. Defina una función que tome como argumento una imagen, y la clasifique en "Angosta" o "Ancha"
;(define
;  (image x)
;  (if (>= (image-height x) (image-width x)) "angosta" "ancha"))


;Modifique el ejercicio anterior para que ahora clasifique las imágenes en "Angosta", "Ancha" o "Cuadrada" (si su alto es igual a su ancho).
(define
  (image x)
  (if (> (image-height x) (image-width x)) "angosta"
      (if (= (image-height x) (image-width x)) "Cuadrada" "ancha"))
  )


;Defina una función que dado tres números que representan la amplitud de los tres ángulos interiores de un triánguno, devuelva un string que nos indique si es equilátero, isósceles o escaleno.
;(define (class-triangulo a1 a2 a3)
;        (if (and (= a1 a2) (= a2 a3))
;            "equilátero"
;            (if (or (= a1 a2) (= a2 a3) (= a3 a1))
;                "isósceles"
;                "escaleno")))


;Modifique el ejercicio anterior para que nos aparezca un mensaje de error en caso que los valores recibidos como argumento no correspondan a los ángulos de un triángulo. Ayuda: La suma de los ángulos interiores de un triángulo es 180°.

;(define (clasifica-triangulo-con-error a1 a2 a3)
;        (if (= (+ a1 a2 a3) 180)
;            (clasifica-triangulo a1 a2 a3)
;            "Error: No es un triángulo"))


;Defina una función que, dados dos valores c y l, devuelva el monto a pagar si se compran c cuadernos y l lápices. Sería bueno que en la definición aparezcan las constantes PL y PC. Su función será más fácil de modificar si hay cambios de precios.
;(define PC 60)
;(define PL 8)
;(define OFERTA-LAPICES 5)
;(define OFERTA-CUADERNOS 4)
;(define DESCUENTO-LAPCIES 1.2) ;Calcular primero el porcentaje de descuento con respecto al precio y poner un valor entero
;(define DESCUENTO-CUADERNOS 6) ;Calcular primero el porcentaje de descuento con respecto al precio y poner un valor entero

;Funcion que calcula el monto de los lapices. En caso de que se lleven 5 o mas se aplica un descuento.
;monto-L : number -> number

;(define (monto-L l)
;  (if  (>= l OFERTA-LAPICES) (* (- PL DESCUENTO-LAPCIES) l) (* PL l)))

;Funcion que calcula el monto de los cuadernos. En caso de que se lleven 4 o mas se aplica un descuento.
;monto-C : number -> number

;(define (monto-C c)
;(if (>= c OFERTA-CUADERNOS) (* (- PC DESCUENTO-CUADERNOS) c) (* PC c)))

;Funcion que calcula el monto final de los lapices y cuadernos que se compren.
;monto-final : number number -> number
;(define (monto-final c l)
;  (+ (monto-C c) (monto-L l)))



;Redefina, usando if, la función pitagorica? de la Práctica 0.
;(define (pitagorica? a b c) (if (= (sqr a) (+ (sqr b) (sqr c)))
;                                #true
;(if (= (sqr b) (+ (sqr a) (sqr c)))
 ;                                   #true
;(if (= (sqr c) (+ (sqr a) (sqr b)))
;                                    #true
;#false))))



;------------------------------------- BANDERAS --------------------------------
;Recuerde que se encuentran disponibles las funciones: rectangle, triangle, rotate, place-image, etc., importando el módulo image desde el menú Lenguaje -> Seleccionar paquete de enseñanza.

;Primero, nos pondremos de acuerdo en algunas definiciones comunes. La idea es que las banderas sean imágenes de 90 pixeles de ancho por 60 de alto. Segundo, todas las banderas las dibujaremos sobre un marco del tamaño indicado. Este marco lo provee la función empty-scene. A modo de ejemplo, si uno escribe el siguiente código,


;(define ejemplo (place-image (rectangle 90 30 "solid" "red")
;                             45 15
;                             (place-image (circle 10 "solid" "blue")
;                                          45 45
;                                          (empty-scene 90 60))))
;en este ejemplo tenemos que el rectangulo esta con 90 ancho y 30 de largo

;Para realizar las distintas banderas, tienen que ser 90 pixeles de ancho y 60 de alto,
;por este motivo, voy a crear dos variables para usarlo a lo largo del programa

(define ANCHO 90)
(define ALTO 60)
;Perú:
;La bandera de Peru sabemos que esta partida en 3 partes, por ende el ANCHO(90) va a estar dividido en 3 (/ ANCHO 3) y alto va a ser el mismo.
;El rectangulo del medio, blanco, tambien va a estar dividido en 3 partes pero el ancho de ese rectangulo va a ser dividido en 2 partes

(define Peru
(place-image (rectangle (/ ANCHO 3) ALTO "solid" "red") (/ ANCHO 6) (/ ALTO 2)
              (place-image (rectangle (/ ANCHO 3) ALTO "solid" "white") (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle (/ ANCHO 3) ALTO "solid" "red") (* 5 (/ ANCHO 6)) (/ ALTO 2)
        (empty-scene ANCHO ALTO)
      )
    )
  )
)



;Italia:
(define italia
(place-image (rectangle (/ ANCHO 3) ALTO "solid" "green") (/ ANCHO 6) (/ ALTO 2)
             (place-image (rectangle (/ ANCHO 3) ALTO "solid" "white") (/ ANCHO 2) (/ ALTO 2)
                          (place-image (rectangle (/ ANCHO 3) ALTO "solid" "red") (* 5 (/ ANCHO 6)) (/ ALTO 2)
                                       (empty-scene ANCHO ALTO)
                                       )
   )))
;Defina una única función que permita, de acuerdo al valor de sus parámetros, crear tanto la bandera de Perú, como la de Italia, como cualquier bandera que esté formada por tres bandas verticales de igual ancho.
(define (banderas-verticales a b c)
  (place-image (rectangle (/ ANCHO 3) ALTO "solid" a) (/ ANCHO 6) (/ ALTO 2)
    (place-image (rectangle (/ ANCHO 3) ALTO "solid" b) (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle (/ ANCHO 3) ALTO "solid" c) (* 5 (/ ANCHO 6)) (/ ALTO 2)
        (empty-scene ANCHO ALTO)
      )
    )
  )
)


;Alemania
(define alemania
  (place-image (rectangle ANCHO (/ ALTO 3) "solid" "black") (/ ANCHO 2) (/ ALTO 6)
               (place-image (rectangle ANCHO (/ ALTO 3) "solid" "red") (/ ANCHO 2) (/ ALTO 2)
               (place-image (rectangle ANCHO (/ ALTO 3) "solid" "yellow") (/ ANCHO 2) (* 5 (/ ALTO 6))
                            (empty-scene ANCHO ALTO)))))
;Holanda
(define holanda
  (place-image (rectangle ANCHO (/ ALTO 3) "solid" "red") (/ ANCHO 2) (/ ALTO 6)
               (place-image (rectangle ANCHO (/ ALTO 3) "solid" "white") (/ ANCHO 2) (/ ALTO 2)
               (place-image (rectangle ANCHO (/ ALTO 3) "solid" "blue") (/ ANCHO 2) (* 5 (/ ALTO 6))
                                       (empty-scene ANCHO ALTO)))))

;Defina una única función que permita, de acuerdo al valor de sus parámetros, crear tanto la bandera de Alemania, como la de Holanda, como cualquier otra bandera formada por tres bandas horizontales de igual alto.

;Para definir esta funcion, lo que haré va a ser usar un poco la lógica que use en las demas, pero reemplazando los valores:
(define (banderas-horizontales x y z)
(place-image (rectangle ANCHO (/ ALTO 3) "solid" x) (/ ANCHO 2) (/ ALTO 6)
               (place-image (rectangle ANCHO (/ ALTO 3) "solid" y) (/ ANCHO 2) (/ ALTO 2)
               (place-image (rectangle ANCHO (/ ALTO 3) "solid" z) (/ ANCHO 2) (* 5 (/ ALTO 6))
                                       (empty-scene ANCHO ALTO)))))



;Defina una única función que dados tres colores y un sentido (vertical/horizontal), permita definir las banderas anteriores.
;Para esta funcion, usare un if, y "equal?" para darle sentido a mi codigo y pueda ejecutarse cualquiera de las dos funciones anteriores
(define (banderas x y z sentido)
  (if (equal? sentido "horizontal")
    (banderas-horizontales x y z)
    (banderas-verticales x y z)
  )
)



;Sudan


;--------------------------------------------------------- PARTE 2 --------------------------------------------------------------------
;CONDICIONALES
;EJEMPLO
;Ejercicio 1. Calcule el resultado de las expresiones (sgn2 (- 2 3)) y (sgn2 6). Verifique sus procedimientos en el evaluador paso a paso de DrRacket .
(define (sgn2 x) (cond [(< x 0) -1]
                       [(= x 0) 0]
                       [(> x 0) 1]))

;Ejercicio 2. Rehaga, utilizando expresiones cond, los ejercicios 2, 4, 6 y 7 de la Práctica 1, 1ra parte - sección 1.3.
; modificacion de ejercicio 2:
(define (img x) (cond [(> (image-height x) (image-width x)) "Flaca"]
                      [(= (image-height x) (image-width x)) "Cuadrada"]
                      [(= (image-height x) (image-width x)) "Cuadrada"]))
;modificación de ejercicio 4:
(define (clasTriangulo2 x y z)
  (if (= (+ x y z) 180)
    (cond [(= x y z) "Equilatero"]
          [(or (= x y) (= x z) (= y z)) "Isoceles"]
          [#true "Escaleno"])
    "Error"))
;modificación ejercicio 6
;(define D10 .18)
;(define preciominimo 1 c)

;modificación ejercicio 7
(define (pitagorica? x y z) (cond [(= (+ (expt x 2) (expt y 2)) (expt z 2)) #true]
                                 [(= (+ (expt y 2) (expt z 2)) (expt x 2)) #false]))



;Ejercicio 4. Hemos decidido hilar más fino en la clasificación de imágenes. Ahora diremos que una imagen es "Muy ancha" si su ancho es más que el doble que su alto. Del mismo modo, diremos que "Muy angosta" si su alto es más que el doble que su ancho. Defina una función, utilizando una expresión cond, que clasifique imágenes en alguna de las categorías "Muy ancha", "Ancha", "Cuadrada", "Angosta", "Muy angosta".
(define (img-cond x)
                (cond [(> (image-width x) (* 2 (image-height x))) "MUY ANCHA"]
                      [(> (image-height x) (* 2 (image-width x))) "MUY ANGOSTA"]
                      [else (image x)]))

;Ejercicio 5. Como parte de una aplicación para observar el clima, se pide clasificar una temperatura de la siguiente forma:
;"Muy frío (MF)" (menos de 0 grados);

;"Frío (F)" (entre 0 y 15 grados);

;"Agradable (A)" (entre 15 y 25 grados);

;"Caluroso (C)" (más de 25 grados);

;Considere la siguiente función:
(define (clasificar t) (cond [(< t 0) "Muy frío (MF)"]
                             [(and (> t 0) (< t 15)) "Frío (F)"]
                             [(and (> t 15) (< t 25)) "Agradable (A)"]
                             [(> t 25) "Caluroso (C)"]))
;Evalúe cada expresión de la forma indicada:
;(clasificar -3), en el área de interacción

;(clasificar 12), con lápiz y papel

;(clasificar 28), con el evaluador paso a paso de DrRacket .

;¿Qué sucede con la expresión (clasificar 15)? Tómese un minuto para entender cuál es el problema ¿Para qué valores sucede lo mismo? Redefina la función para todas las temperaturas queden clasificadas (decida usted en qué categoría quedan los valores no contemplados previamente).
; lo que pasa con 15 es que esta entre 0 y 15 por lo tanto, da que todos los resultados #f, pero si separamos y 15 queda solo, se arregla

(define (clasificar2 t) (cond [(< t 0) "muy frio"]
                             [(< t 15) "Frío (F)"]
                             [(< t 25) "Agradable (A)"]
                             [#true "Caluroso (c)"]))



;------------- PREDICADOS -----------------}

;ejemplo
(define (sgn3 x) (cond [(number? x) (sgn2 x)]
                       [(string? x) (sgn2 (string->number x))]))

;Ejercicio 6. Muchas veces se identifica a los valores booleanos con los números 0 (para #false) y 1 (para #true). Con esta identificación en mente, extienda la función signo para que pueda procesar booleanos.
(define (sgn4 x) (cond [(= 1 x) #t]
                       [(= 0 x) #f]))

;Ejercicio 7. Las imágenes "Angostas" son negativas, mientras que las "Anchas" son positivas. Obviamente, las "Cuadradas" equivalen al 0 de los números. Extienda la función signo para soportar imágenes

