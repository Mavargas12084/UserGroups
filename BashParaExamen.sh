﻿#!/bin/bash

Usuario=$1

ValidarUsuario(){
	AuxiliarValidar="$(id $Usuario)"
	echo "$AuxiliarValidar"
	echo "Validando la existencia del Usuario"
	if $AuxiliarValidar &>/dev/null; then 
		echo "El Usuario no existe" 
		echo "Deseas Agregarlo?..."
		echo "1)Si"
		echo "2)No"
		read OpcionValidar
		if [ $OpcionValidar -eq "1" ]; then
			sudo adduser $Usuario 
			echo "Usuario Creado"
		else
			echo "Se Cancela Agregar Usuario" 
		fi
	else 
		clear
		echo "El Usuario $Usuario Existe" 
		
	fi
}

BuscarUsuario(){
	echo $Usuario
	set AuxiliarBusqueda
	AuxiliarBusqueda="$(groups $Usuario)"
	if $AuxiliarBusqueda &>/dev/null; then
		echo "$Usuario No existe en los grupos"
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
		else
			echo "Existe en los grupos"
			echo "..........."
			groups $Usuario
		fi
	fi
}

EliminarUsuario(){
	echo "Desea Eliminar Usuario $Usuario ??"
	echo "1)Si"
	echo "2)No"
	read OpcionEliminar
	if [ $OpcionEliminar -eq "1" ]; then
		sudo userdel -f $Usuario
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
read OpcionMenu

if [ $OpcionMenu -eq "1" ]; then
	ValidarUsuario
elif [ $OpcionMenu -eq "2" ]; then
	BuscarUsuario
elif [ $OpcionMenu -eq "3" ]; then
	EliminarUsuario
else 
	echo "Opcion No Valida"
fi