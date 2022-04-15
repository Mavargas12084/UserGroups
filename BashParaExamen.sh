﻿#!/bin/bash

$1

ValidarUsuario(){
	AuxiliarValidar="$(id $1)"
	echo "Validando la existencia del Usuario"
	if $AuxiliarValidar &>/dev/null; then 
		echo "El Usuario no existe" 
		echo "Deseas Agregarlo?..."
		echo "1)Si"
		echo "2)No"
		read OpcionValidar
		if [ $OpcionValidar -eq "1" ]; then
			sudo adduser $1 
			echo "Usuario Creado"
		else
			echo "Se Cancela Agregar Usuario" 
		fi
	else 
		clear
		echo "El Usuario $1 Existe" 
		
	fi
}

BuscarUsuario(){
	AuxiliarBusqueda="$(groups $1)"
	echo "$AuxiliarBusqueda"
	if [ "$AuxiliarBusqueda" &>/dev/null ]; then
		echo "$1 No existe en los grupos"
		echo "Deseas agregarlo a algun grupo?..."
		echo "1)Si"
		echo "2)No"
		read OpcionBusqueda
		if [ $OpcionBusqueda -eq "1" ]; then
			clear
			echo "Ingresa nombre del grupo: "
			read Grupo
			sudo addgroup $Grupo 
			echo "Agregado con Exito"
		fi
	else
		echo "Existe en los grupos"
		echo "..........."
		groups $1
	fi
}

EliminarUsuario(){
	echo "Desea Eliminar Usuario $1 ??"
	echo "1)Si"
	echo "2)No"
	read OpcionEliminar
	if [ $OpcionEliminar -eq "1" ]; then
		sudo userdel -f $1
		echo "El Usuario ha sido eliminado"
	else
		echo "Cancelado Eliminar Usuario"
	fi
}

echo "Bienvenido $1"
echo "=========== Manejo de Usuarios ============="
echo "Seleccione una Opcion Valida:"
echo "1)Validar Existencia de Usuario"
echo "2)Validar Existencia de Usuario en Grupos"
echo "3)Eliminar Usuario"
echo "Ingrese una Opcion: "
OpcionMenu=0
read OpcionMenu

case $OpcionMenu in
	1)
		clear
		ValidarUsuario
	;;
	2)
		clear
		BuscarUsuario
	;;
	3)
		clear
		EliminarUsuario
	;;
esac
