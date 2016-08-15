#!/bin/bash
# Compilador CyanBlack
# https://github.com/CyanBlack/CyanBlack_Compiler

#----------------------------------------------------------#
#                  Variables y funciones                   #
#----------------------------------------------------------#
version="0.5" # Version de la ROM (1.0 - 2.0 - etc...).
device="cooperve" # Para informar al usuario del dispositivo al cual soporta el telefono (cooper - cooperve - tass - tassve - ghost - condor - etc...).
build="unofficial" # La build de la ROM (unofficial - official - beta - nightly - snapshot).
date=`date +%Y-%m-%d` # Fecha de la compilacion de la ROM. Esta no se puede editar.
PS3="Please enter the option here: " # Pregunta que opcion quieres (?)
options="Compile Wipe Wipe->Compile Exit" # Opciones

case $(head -n1 /etc/issue | cut -f 1 -d ' ') in # Detectamos Sistema Operativo (Nada importante)
    Debian)     OS="debian" ;; # Detecta que es Debian
    Ubuntu)     OS="ubuntu" ;; # Detecta que es Ubuntu
    *)          OS="rhel" ;; # Detecta que es RHel (Centos normalmente)
esac

#----------------------------------------------------------#
#                       Compilador                         #
#----------------------------------------------------------#
echo "--------------------------------------"
echo "--------------------------------------"
echo "             Welcome To               "
echo "         CyanBlack Compiler           "
echo "     Operative System "$OS"           "
echo "--------------------------------------"
echo "--------------------------------------"
select opt in $options; do
    if [ "$opt" = "Compile" ]; then
        echo "---------------------------------------------------"
        echo "---------------------------------------------------"
        echo "The source will be compiled without 'Zipaling Apps'"
        echo "---------------------------------------------------"
        echo "---------------------------------------------------"
        zip -r cbos-"$version"-"$date"-"$build"-"$device".zip ./*
    elif [ "$opt" = "Wipe" ]; then
        echo "---------------------------------------------------"
        echo "---------------------------------------------------"
        echo "           The ZIP will be erased...               "
        echo "---------------------------------------------------"
        echo "---------------------------------------------------"
        rm -f *.zip
    elif [ "$opt" = "Wipe->Compile" ]; then
        echo "---------------------------------------------------"
        echo "---------------------------------------------------"
        echo "The ZIP will be erased and Re-Compiled for Updates."
        echo "---------------------------------------------------"
        echo "---------------------------------------------------"
        rm -f *.zip
        zip -r cbos-"$version"-"$date"-"$build"-"$device".zip ./*
    elif [ "$opt" = "Exit" ]; then
        clear
        echo "--------------------------------------"
        echo "--------------------------------------"
        echo "             Bye Bye!! :D             "
        echo "        Program END: "$date"          "
        echo "--------------------------------------"
        echo "--------------------------------------"
        break
    fi
done
