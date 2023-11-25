# Ejercicio: escribir una funcion que dada una lista imprima todos los valores que la forman
# con recursividad
def imprimeValoresLista(lista):
    if lista != []:
        print(lista[0])
        imprimeValoresLista(lista[1:]) 
#imprimeValoresLista([1, 2, 3, "pan"])
# sin recursividad, utilizando FOR
def imprimevaloresFor(lista):
    for elemento in lista:
        print(elemento)

# Ejercicio: calcular el factorial de un número
def factorialIterativo(n):
    factorial = 1
    for numero in range(1, n+1):
        factorial = factorial * numero
    print(factorial)
#factorialIterativo(5)

# Ejercicio: imprimir los 25 numeros naturales pares
def natPares():
    for i in range(0, 50, 2):
        print(i)
#natPares()

# Ejercicio: imprimir felicidades
def felicitaciones(): 
    edad = 0
    while edad < 5:
        edad = edad + 1
        print(f"felicidades, tienes: {edad}")
#felicitaciones()

# Ejercicio: simula el eco
def eco():
    salir = False
    while not salir:
        entrada = input("ingrese un mensaje: ")
        if entrada == "adios":
            salir = True
        else: print(entrada)
#eco()

# Ejercicio: factorial con while
def factWhile(n):
    if n == 0:
        return 1
    else:
        x = 1
        factorial = 1
        while x <= n:
            factorial = factorial * x
            x = x + 1
        return factorial
#factWhile(5)
# Ejercicios con For

# Escriba un ciclo definido para imprimir por pantalla todos los números entre 10 y 20.
def numDyV():
    contador = 9
    for i in range(contador, 20):
        contador = contador + 1
        print(contador)
#numDyV()

#Escriba un programa que imprima por pantalla todas las fichas del dominó, una por línea y sin repetir.
def domino():
    fichas = 0
    for i in range(fichas, 28):
        fichas = fichas + 1
        print(fichas)
#domino()

#Modifique el programa anterior para que pueda generar fichas de un juego que puede tener números de 0 a n.
def juego(n):
    fichas = 0
    for i in range(0, n):
        fichas = fichas + 1
        print(fichas)
#juego(10)

#4. Escriba una función que tome una cantidad m de valores que serán ingresados
# por el usuario y, a medida que se ingresa cada número, muestre el factorial del mismo. El valor
# de m es ingresado inicialmente por el usuario 
#def factoriales():
#    m = int(input("ingrese la cantidad de valores: "))
#    for i in range(m):
#        valor= int(input("ingrese un numero: "))
#        factorial_valor = factorialIterativo(valor)
#        print(f"el factorial de {valor} es: {factorial_valor}")
#factoriales()

# Ciclo while
# Escriba una función que le pida al usuario que ingrese un número positivo. Si el
# usuario ingresa cualquier cosa que no sea lo pedido se le debe informar de su error mediante
# un mensaje y volver a pedirle el número, repitiendo este proceso hasta que ingrese lo pedido

def numPos():
    salir = False
    while not salir:
        entrada=int(input("ingrese un numero positivo: "))
        if entrada < 0:
            salir = True
        else: print(entrada) 
#numPos()

#Escriba un programa que permita al usuario ingresar un conjunto de notas, preguntando a cada paso si desea ingresar más notas, e imprima el promedio correspondiente al finalizar la toma de datos.
"""
def promedio(n):
    if len(n) > 0:
        return sum(n) / len(n)
    else: 0
def ingresarNotas():
    notas = []
    continuar = True

    while continuar:
        try:
            nota = float(input("ingrese una nota: "))
            notas.append(nota)

            respuesta = input("Desea ingresar una nota? s/n: ")
            if respuesta.lower() != "s":
                continuar = False
        except ValueError:
            print("error: ingresa un numero valido")
    return notas

notas_ingresadas = ingresarNotas()
promedio = promedio(notas_ingresadas)

print(f'\nNotas ingresadas: {notas_ingresadas}')
print(f'promedio: {promedio}') 
"""

#Escriba un programa que pida dos números enteros. El programa pedirá de nuevo
#el segundo número mientras no sea mayor que el primero. El programa terminará escribiendo
#los dos números
"""
def numInt():
    n1 = int(input('ingrese un numero: '))
    n2 = int(input('ingrese otro numero (debe ser mayor que el primero): '))

    while n1 <= n2:
        print('error, el segundo debe ser mayor que el primero')
        n2 = int(input('ingrese nuevamente un numero: '))
    print(f'los numeros ingresados son {n1} y {n2}')
numInt()
"""

#Escriba una función que reciba dos números como parámetros y 
#devuelva cuántos múltiplos del primero hay que sean menores que el segundo.
def multiplos(n, m):
    contador = 0
    if n <= 0:
        return 0
    
    for i in range(1, m):
        if n * i < m:
            contador += 1
        else: break
    print(contador)

# Manejo de contraseñas
#  Escriba un programa que contenga una contraseña inventada. El programa debe preguntarle 
# al usuario la contraseña y no permitirle continuar hasta que la haya ingresado
# correctamente
"""
def usuario():
    password = 'messicampeondelmundo'
    continuar = True
    while continuar:
        ps = input('ingrese contraseña: ')
        if ps != password:
            return input('ingrese nuevamente: ') 
        else: continuar 
usuario()
"""
# Otra solucion:
"""
def verificar_contrasenia():
    password = 'vamo_ñubel_carajo'
    while True:
        intento_pass = input('ingrese contraseña: ')

        if intento_pass == password:
            print('contraseña correcta, acceso permitido')
            break
        else:
            print('contraseña incorrecta. Intentelo de nuevo')
verificar_contrasenia()
print('programa continua ejecutandose')
"""

#Escriba una función que reciba un número natural e imprima todos los números
# primos que hay menores o iguales que ese número
"""
def es_primo(numero):

    if numero <= 1:
        return False
    for i in range(2, int(numero**0.5) + 1):
        if numero % i == 0:
            return False
    return True
def numeros_primos(n):
    contador = 0
    for i in range(n, n-1):
        n = n + 1
        print(n)
numeros_primos(10)
"""

