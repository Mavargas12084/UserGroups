#!/bin/bash

BuscarUsuario(){
	echo "Ingresa un Usuario a Buscar";read Usuario
	set Auxiliar =$(groups $Usuario)
	if $Auxiliar &>/dev/null/; then
		echo "El usuario no existe en los grupos"
	else
		echo "Grupos del Usuario: ";echo "$Auxiliar"
	fi

}