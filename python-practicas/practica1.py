#Ejercicio 1. Escriba un programa que imprima los primeros 25 números naturales pares.
def imprimir_pares2():
    numero = 2
    contador = 0

    while contador < 25:
        print(numero)
        numero += 2
        contador += 1
#imprimir_pares2()

#Ejercicio 2. Escriba un programa que imprima los primeros 100 números naturales pares.
def pares100():
    numero100 = 2
    contador = 0

    while contador <= 100:
        print(numero100)
        numero100 += 2
        contador += 1
#pares100()
# Ejercicio 3. Escriba un programa que imprima los primeros n números pares mayores que m.
def imprime_num_mayores(n, m):
    contador = 0
    numero = m + 1

    while contador < n:
        if numero % 2 == 0:
            print (numero)
            contador += 1
        numero += 1
#n = int(input("Ingrese el valor de n: "))
#m = int(input("Ingrese el valor de m: "))

#imprime_num_mayores(n, m)

#Ejercicio 4. Escriba un programa que calcule e imprima el resultado de la suma de los primeros 50 números naturales usando una función recursiva.
def sumaNat(n):
    # caso base
    if n == 1:
        return 1
    # recursivo
    else: return n + sumaNat (n - 1)
#resultado = sumaNat(50)
#print(resultado)
#Ejercicio 5. Escriba un programa que calcule e imprima el resultado de la suma de los primeros n números naturales usando una función recursiva
def sumaNat2(n):
    if n == 0:
        return 0
    else: return n + sumaNat2(n - 1)

#n = int(input("ingrese el valor de n: "))
#resultado = sumaNat2(n)
#print(resultado)
#Ejercicio 6. Escriba un programa que calcule e imprima el resultado de la suma de los números naturales mayores que n y menores que m usando una función recursiva.
def sumaNat3(n, m):
    if n >= m:
        return 1
    else: return n + sumaNat3(n + 1, m)
#n = int(input("ingrese el valor de n: "))
#m = int(input("ingrese el valor de m: "))
#resultado = sumaNat3(n + 1, m)
#print(resultado)

# ejercicio 7
def duplicar(s):
    resultado = s + s
    return resultado
#s1 = str(input("ingrese una palabra: "))
#resultadofinal = duplicar(s1)
#print(resultadofinal)
# ejercicio 8
def duplicaname(s, n):
    resultado = s * n
    return resultado
#s1 = str(input("ingrese una palabra:"))
#s2 = int(input("ingrese un numero: "))
#resultadofinal= duplicaname(s1,s2)
#print(resultadofinal)    

#Escriba una función suma que reciba dos números y retorne el resultado de la suma de ambos.
def suma(x, y): 
    resultado = x + y    
    return resultado
#n1 = float((input ("ingrese un numero: ")))
#n2 = float((input ("ingrese un numero: ")))
#resultadofinal = suma(n1, n2)
#print(f"la suma de {n1} y {n2} es: {resultadofinal}")
#Escriba una función resta que reciba dos números y retorne el resultado de la resta de ambos.
def resta(x, y):
    resultado= x - y
    return resultado
#n1 = float (input ("ingrese un numero: "))
#n2 = float(input("ingrese un numero: "))
#restaf = resta(n1, n2)
#print(f"la resta entre {n1} y {n2} es {restaf}") 
# Escriba una función multiplica que reciba dos números y retorne el resultado de la multiplicación de ambos números.
def multi(x, y):
    resultado= x * y
    return resultado
#n1 = float (input ("ingrese un numero: "))
#n2 = float(input("ingrese un numero: "))
#multif = multi(n1, n2)
#print(f"la multiplicacion entre {n1} y {n2} es {multi}")

# Escriba una función divide que reciba dos números y retorne el resultado de la divisiónde ambos números.
def div(x, y):
    if y != 0:
        return x / y
    else: return "error, no se pueded dividir por cero"
#n1 = float (input ("ingrese un numero: "))
#n2 = float(input("ingrese un numero: "))
#divf = div(n1, n2)
#print(f"la division entre {n1} y {n2} es {divf}")

# calculadora
def calculadora():
    print("Elija una opción:")
    print("1. Suma")
    print("2. Resta")
    print("3. Multiplica")
    print("4. Divide")

    opcion = input("elija la opcion deseada")

    n1 = float(input("Ingrese el primer número: "))
    n2 = float(input("Ingrese el segundo número: "))

    if opcion == "1":
        resultado = suma(n1, n2)
    elif opcion == "2":
        resultado = resta(n1, n2)
    elif opcion == "3":
        resultado = multi(n1, n2)
    elif opcion == "4":
        resultado = div(n1, n2)
    else: resultado = "opcion invalida"

    print(f"El resultado es {resultado}")
calculadora()





