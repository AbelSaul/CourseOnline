#language: es
Característica: Comprobar si es usuario de AppSuscriptions mediante el email para poder llevar un mejor control de los usuarios en CourseOnline 
	Como gerente
	Yo quiero comprobar mediante el email si es un usuario de AppSuscriptions
	Para poder llevar un mejor control de mis usuarios

Escenario: Comprobar si es usuario de AppSuscriptions mediante el email
    Dado que tengo el email 'abelmiraval@gmil.com'
    Cuando realizo la busqueda
    Entonces deberia obtener 'Es usuario del sistema AppSuscriptions'





