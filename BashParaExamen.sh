#!/bin/bash

BuscarUsuario(){
	set Usuario
	echo "Ingresa un Usuario a Buscar";read Usuario
	set Auxiliar=$(groups $Usuario)
	if $Auxiliar &>/dev/null; then
		echo "El usuario no existe en los grupos"
		echo "Desea agregar el usuario a algun grupo?"
		echo "1)Si"
		echo "2)No"
		set Opcion;	read Opcion
		if Opcion = 1; then
			echo ""
			echo "Ingrese el nombre del grupo para $Usuario: "
			set Grupo; read Grupo
			sudo adduser $Usuario $Grupo
		elif Opcion = 2; then
			echo ""
			echo "Cancelado..."
		else
			echo "Ingrese una opcion valida"
		fi
	else
		echo "Grupos del Usuario: ";echo "$Auxiliar"
	fi

}

BuscarUsuario