Funcion  añadir ( datos ) //Función INTRPDUCIR CONTACTOS
	Definir dato,num,resp como texto
	Definir cont Como Entero
	Definir seguir como logico
	cont=0
	//Introducimos contactos
	Repetir
		seguir=Falso
		Escribir "Introduce nombre"
		Leer dato
		dato=Minusculas(dato)
		datos[cont,0]=dato
		Escribir "Itroduce DNI"
		Leer num
		num=Minusculas(num)
		datos[cont,1]=num
		//Si el contador es mayor que uno, comprobamos que no hay ningun contacto con el mismo número
		Si cont>0 Entonces
			seguir=comprobar(datos,num,cont)
		Fin Si
		//En caso de que se compruebe que hay un contacto repetido, mostraremos que el mensaje
		Si seguir=Verdadero Entonces
			Escribir "Contacto ya existente"
			cont=cont-1 //Restamos uno al contador, ya que el contacto no ha sido introducido.
		Fin Si
		//Si el contacto se ha añadido correctamente, preguntaremos si quiere añadir más contactos.
		Si seguir=Falso Entonces
			Escribir "¿Desea añadir más contactos? (S/N)"
			Leer resp
			resp=Minusculas(resp)
			Segun resp Hacer
				"s" o "si":
					seguir=Verdadero
				"n" o "no":
					seguir=Falso
			Fin Segun
		Fin Si
		cont=cont+1 //Sumamos uno al contador
	Hasta Que seguir=Falso
	
Fin Funcion



Funcion resultado <- comprobar ( datos,num,cont ) //Función comprobación repetido al introducir un contacto
	Definir x Como Entero
	Definir resultado como logico
	Para x=cont-1 Hasta 0 Con Paso -1 Hacer
		Si num=datos(x,1) Entonces
			resultado=Verdadero
		Fin Si
	Fin Para
Fin Funcion



Funcion  buscar ( agenda ) //Función buscar contactos
	Definir r,d Como Texto
	Definir j Como Entero
	
	Escribir "¿Buscar por DNI?(S/N)"
	Leer r
	r=Minusculas(r)
	Si r="s" Entonces
		Escribir "Introduce DNI"
		Leer d
		d=Minusculas(d)
		Para j=0 Hasta 9 Con Paso 1 Hacer
			Si d=agenda[j,1] Entonces
				Mostrar agenda[j,0], " ", agenda[j,1]
			Fin Si
		Fin Para
	Sino
		Escribir "Introduce nombre"
		Leer d
		d=Minusculas(d)
		Para j=0 Hasta 9 Con Paso 1 Hacer
			Si d=agenda[j,0] Entonces
				Mostrar agenda[j,0], " ", agenda[j,1]
			Fin Si
		Fin Para
	Fin Si
	
	
Fin Funcion

Funcion  enseñar ( nom )
	Definir m,z Como Entero
	Para m=0 Hasta 9 Con Paso 1 Hacer
		
		Mostrar nom[m,0], " ", nom[m,1]
		
	Fin Para
Fin Funcion

Algoritmo AGENDA_DE_CONTACTOS
	Definir n,i,k como entero
	Definir contactos como texto
	Dimension contactos[10,2]
	Para i=0 Hasta 9 Con Paso 1 Hacer
		Para k=0 Hasta 1 Con Paso 1 Hacer
			contactos[i,k]="vacío"
		Fin Para
	Fin Para
	Repetir
		Escribir "1.-Añadir contacto"
		Escribir "2.-Buscar contacto"
		Escribir "3.-Mostrar todos"
		Escribir "4.-Salir"
		Leer n
		Segun n Hacer
			1:
				añadir(contactos)
			2:
				buscar(contactos)
			3:
				enseñar(contactos)
		Fin Segun
	Hasta Que n=4
	
	
FinAlgoritmo
