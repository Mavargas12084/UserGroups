#!/bin/bash

BuscarUsuario(){
	echo "Ingresa un Usuario a Buscar";read Usuario
	set Auxiliar =$(groups $Usuario)
	if $Auxiliar &>/dev/null/; then
		echo "El usuario no existe en los grupos"
		echo "Desea agregar el usuario a algun grupo?"
		echo "1)Si"
		echo "2)No"
		set Opcion
		read Opcion
	else
		echo "Grupos del Usuario: ";echo "$Auxiliar"
	fi

}