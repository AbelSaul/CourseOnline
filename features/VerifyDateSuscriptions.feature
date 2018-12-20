#language: es
Característica: Comprobar mediante el email si el usuario tiene su suscripcion esta activa
	Como gerente
	Yo quiero comprobar mediante el email si ese usuario tiene su suscripcion activa 
	Para poder llevar un mejor control de las suscripciones activas

Escenario: Comprobar mediante el email si un usuario tiene su suscripcion activa
    Dado que tengo el siguiente usuario 'abelmiraval@gmail.com'
    Cuando realizo la comprobacion
    Entonces deberia obtener el siguiente resultado 'Este usuario tiene suscripcion activa'
