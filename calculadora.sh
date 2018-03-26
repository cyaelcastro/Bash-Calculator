#!/bin/bash
whiptail --title "Calculator" --msgbox "Hi, i'm a calculator, choose OK to continue" 10 60
primerOperando=$(whiptail --title "Calculator" --inputbox "Please  the first operator" 10 60 3>&1 1>&2 2>&3)

[[ $primerOperando =~ ^[0-9.-]+$ ]]

if [ 1 -eq $? ]; then
	whiptail --title "Calculator" --msgbox "Check your input" 10 60
	exit
fi

operacion=$(whiptail --title "Calculator" --radiolist \
"Choose the operator. Select with spacebar" 15 60 4 \
"+" "Suma" ON \
"-" "Resta" OFF \
"*" "Multiplicacion" OFF \
"/" "Division" OFF 3>&1 1>&2 2>&3)

segundoOperando=$(whiptail --title "Calculator" --inputbox "Please type the second operator" 10 60 3>&1 1>&2 2>&3)

if [[ ${operacion} == '/' ]]; then

	if [ $segundoOperando -eq '0' ]; then
	whiptail --title "Calculator" --msgbox "Ops, a zero value " 10  59
	exit
	fi
fi

final=$(bc <<< "${primerOperando}${operacion}${segundoOperando}")
whiptail --title "Calculator" --msgbox " ${primerOperando}${operacion}${segundoOperando}  = ${final}" 10 60 
