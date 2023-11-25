# Tuplas y Listas

# Ejercicio:
def imprimeValores(tupla):
    for elemento in tupla:
        print(elemento)
#imprimeValores((1,2,3,4,5))
# de forma recursiva
def imprimeVal2(tupla):
    if tupla !=():
        print(tupla[0])
        imprimeVal2(tupla[1:])
#imprimeVal2((1,2,3,4))


# Ejercicio: almacenar datos de un curso
"""
def agregaAlumno(listaDeAlumnos):
    print('Se va agregar un alumno a la lista de alumnos existentes')
    nombre = input('Nombre: ')
    apellido = input('Apellido: ')
    telefono = input('Telefono: ')
    listaDeAlumnos += [(nombre, apellido, telefono)]

def muestraListaAlumnos(listaDeAlumnos):
    for (nombre, apellido, telefono) in listaDeAlumnos:
        print('El alumno', nombre, apellido, 'tiene el telefono: ', telefono) 
"""

# Ejercicio 1
def posicionesMultiplo(lista, numero):
    newL=[]
    for x in range(0, len(lista)):
        if x % numero == 0:
            newL.append(lista[x])
    return newL
resultado = posicionesMultiplo((1,2,3,4,5,6,7), 2)
print(resultado)        

# Ejercicio 2
def sumNum(list):
    sum = list[0]
    newList = [sum]
    for x in range(0, len(list)):
        sum  += list[x]
        newList.append(sum)
    return newList
resultado = sumNum([1, 2, 2])
print(resultado)

# Ejercicio 3
def elimina(list):
    if len(list) < 2:
        print('la lista debe tener al menos dos elementos')
        return None
    newList = list[1:-1]
    return newList
respuesta = elimina([1,2,3,4])
print(respuesta)

# Ejercicio 4
def ordenada(list):
    return list == sorted(list)
respuesta = ordenada([1, 2, 3])
print(respuesta)

# Ejercicio 5
def duplicados(list):
    return list == set(list)
respuesta = duplicados([2, 2, 2, 2, 2])
print(respuesta)


#### CADENAS 
# Ejercicio 1
def Ej1(str):
    for caracter in reversed(str):
        print(caracter, end='')
# Ejercicio 2
def Ej2(str, n):
    contador = 0
    for x in n:
        if x == n:
            contador += 1
    return contador

# Tuplas





    
    