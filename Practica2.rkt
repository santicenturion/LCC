;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;------------------------------------ PRACTICA 2 -------------------------------------------------------
;Buenas practicas, documentacion de codigo y diseño de datos


;Ejercicio 1. Diseñe una función distancia-origen, que recibe dos números x e y, devolviendo como resultado la distancia al origen del punto (x,y).
;Cómo sabemos que la formula para calcular la distancia entre dos puntos, son esos dos numeros sumados, elevados al cuadrado sobre una raiz cuadrada, lo que hacemos es proseguir con el diseño de datos:

;Representamos valores mediante numeros
; x, y: number -> number
; Recibe dos valores, evalua sus cuadrados, los suma y saca su raiz cuadrada
; Entrada: 3 y 4, Salida: 5
; Entrada: 6 y 8. Salida: 10
; Entrada: 5 y 9. Salida: #i10.295630140987
(define (dist-origen x y)
  (sqrt (+ (expt x 2) (expt y 2))))

;Ejercicio 2. Diseñe una función distancia-puntos, que recibe cuatro números x1, y1, x2 e y2 y devuelve la distancia entre los puntos (x1, y1) y (x2, y2).
;En este, podremos seguir la misma lógica que en el diseño anterior, pero sumamos x1, y1, x2 e y2.

;Representamos valores mediante números
; x1, y1, x2, y2: Number -> Number
; Recibe 4 valores, resuelve el cuadrado de todos, suma (x1, y1), (x2 y2) y devuelve la raiz cuadrada de ese resultado.
; Entrada 3, 4, 6, 8. Salida: #i11.180339887498949
; Entrada 10, 10, 10, 10. Salida: 20
(define (dist-puntos x1 x2 y1 y2)
  (sqrt (+ (+ (expt x1 2) (expt y1 2)) (+ (expt x2 2) (expt y2 2)))))

;Ejercicio 3. Diseñe la función vol-cubo que recibe la longitud de la arista de un cubo y calcula su volumen.
;Para diseñar esta función, se necesita saber que el volumen de un cubo es la arista elevada al cubo.
; Reepresenta valores mediante numeros
; a: Number -> Number
; Recibe un valor numerico, lo eleva al cubo y calcula su resultado
(define (vol-cubo a)
  (expt a 3))
;(vol-cubo 5) -> 125
;(vol-cubo 8) -> 512

;Ejercicio 4. Diseñe la función area-cubo que recibe la longitud de la arista de un cubo y calcula su área.
;Representamos valores mediante números
; a: Number -> Number
; Recibe un valor numerico, lo eleva al cuadrado y a dicho resultado lo multiplica por 6
(define (area-cubo a)
  (* (expt a 2) 6))
;(area-cubo 4) -> 96
;(area-cubo 60) -> 21600

;Ejercicio 5. Diseñe la función string-insert, que consume un string y un número i e inserta "-" en la posición i-ésima del string
; Para este ejercicio lo que necesito es una funcion que me permita insertar cualquier cosa, en este caso un - en la posición que yo desee, o que el usuario desee
;Representamos valores mediante numeros y cadena de caracteres
;str pos: string -> string
;Recibe un valor string, le agrega un - en la posición que le pidas, recorda que se cuenta desde 0
(define (string-insert str pos) (string-append (substring str 0 pos) "-" (substring str (+ pos 1) )) )
;(string-insert "hola mundo" 4) -> "hola-mundo"
;(string-insert "hola mundo" 2) -> "ho-a mundo"

;Ejercicio 6. Diseñe la función string-last, que extrae el último caracter de una cadena no vacía.
;Representamos valores mediante cadena de caracteres
;str: string -> string
;recibe un valor como string y devuelve un caracter, de hecho, su ultimo caracter
(define
(string-last s)
(substring s 0 (- (string-length s) 1)))
;(string-last "hola") -> "hol"




;Ejercicio 9. Un Instituto de Portugués decide lanzar las siguientes promociones buscando aumentar la cantidad de alumnos:

;Si se anotan 2 amigos, cada uno obtiene un 10% de descuento sobre el valor de la cuota; mientras que si se anotan 3 o más el descuento alcanza el 20%

;Si al momento de pagar se decide abonar 2 meses juntos se recibe un descuento del 15%; en caso de cancelar 3 o más meses a la vez la reducción es del 25%

;Las promociones son combinables, pero nunca pueden superar el 35% de descuento. El valor original de la cuota mensual es de $650.

;La administración del Instituto nos solicitó diseñar la función monto-persona, la cual recibe la cantidad de personas que se están anotando y la cantidad de meses que abonan (para que se aplique la promoción deben pagar la misma cantidad de meses), y devuelve el monto que el Instituto debe cobrarle a cada uno. Para desarrollar monto-persona es conveniente definir ciertas constantes, ya que los precios pueden variar con el tiempo.

;Ejemplos:

;Supogamos que Pedro y Juan deciden anotarse al curso de Portugués pagando 2 meses juntos, obtendrán un descuento del 25%, debiendo pagar $975 cada uno.

;Si Pedro y Juan también invitan a Paula y cancelan 3 meses juntos, recibirán una reducción del 35%, debiendo abonar $1267.50 cada uno.

;Si José se anota solo, pero paga 5 cuotas juntas, entonces deberá abonar $2437.5

;PROGRAMA PARA INSTITUTO DE PORTUGUES
;Comenzamos creando las constantes que utilizaremos a lo largo del programa
;Dichas constantes tendrán valores numericos: NUMBER
(define CUOTA 650)
(define DOS-AMIGOS (* CUOTA 0.1))
(define TRES-O-MAS (* CUOTA 0.2))
(define DOS-MESES-JUNTOS (* CUOTA 0.15))
(define TRES-MESES-O-MAS (* CUOTA 0.25))

(define (monto-persona p m) (cond [ (= 2 p) DOS-AMIGOS ]
                                  [ (>= 3 p) TRES-O-MAS ]
                                  [ (= 2 m) DOS-MESES-JUNTOS ]
                                  [ (>= 3 m) TRES-MESES-O-MAS]))


;Ejercicio 10. Tomando como base los resultados obtenidos en un laboratorio de análisis clínicos, un médico determina si una persona tiene anemia o no, lo cual depende de su nivel de hemoglobina en la sangre y de su edad.

;Si el nivel de hemoglobina que tiene una persona es menor que el valor mínimo que le corresponde de acuerdo a su edad, el resultado del análisis es "anemia positivo" y en caso contrario es "anemia negativo".

;El médico se basa en los siguientes valores mínimos para cada grupo de edades:
;edad <= 1 mes: nivel mínimo de hemoglobina normal 13 g/dl

;1 mes < edad <= 6 meses: nivel mínimo de hemoglobina normal 10 g/dl

;6 meses < edad <= 12 meses: nivel mínimo de hemoglobina normal 11 g/dl

;1 año < edad <= 5 años: nivel mínimo de hemoglobina normal 11.5 g/dl

;5 años < edad <= 10 años: nivel mínimo de hemoglobina normal 12.6 g/dl

;10 años < edad: nivel mínimo de hemoglobina normal 13 g/dl

;Diseñe una función anemia que recibiendo la edad de una persona expresada en meses y la hemoglobina en sangre expresada en g/dl devuelva #true si la persona está anémica, #false en caso contrario.

;Expresamos valores numericos, resultados en booleanos
;

(define (anemia e h)(cond [(<= e h) #t])


  ;Ejercicio 12. El consumo promedio de una Chevrolet Zafira modelo 2010 es de 8km/l en ciudad y 11km/l en ruta. Es decir, ese modelo de auto utiliza un litro de nafta para recorrer 8km en ciudad, pero en ruta la misma cantidad de combustible alcanza para recorrer 11km.

;Estos valores fueron calculados utilizando nafta grado 2 (conocida como "súper"). Al cargar combustible con nafta grado 3 (conocida como "premium"), el rendimiento mejora un 10%. Por lo tanto, con cada litro de combustible grado 3 se puede recorrer un 10% más de distancia de la especificada en el párrafo anterior.

;Diseñe una función autonomía, que dados los siguientes argumentos:
;La cantidad de litros restantes en el tanque de combustible, y

;La clase de combustible que se está utilizando,

;devuelva un string indicando la autonomía del auto, tanto en ciudad como en ruta.
;Por ejemplo, si quedan 20 litros de nafta grado 2 en el tanque de combustible, se espera que el string que devuelva la función autonomía sea

;"Autonomía en ciudad: 160km. Autonomía en ruta: 220km."

;En cambio, si quedan 20 litros de nafta grado 3, se espera que el string sea:

;"Autonomía en ciudad: 176km. Autonomía en ruta: 242km."

;Utilice constantes y todas las funciones auxiliares que crea conveniente para lograr un buen diseño.


;Para diseñar esta función voy a necesitar constantes, con valores numericos, expresando los litros de nafta

(define NAFTA_SUPER_CIUDAD (= 1 "8km"))
(define NAFTA_SUPER_RUTA (= 1 "11km"))


  