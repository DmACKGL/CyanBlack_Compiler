#!/bin/bash
# Compilador CyanBlack
# https://github.com/CyanBlack/CyanBlack_Compiler

#----------------------------------------------------------#
#                  Variables y funciones                   #
#----------------------------------------------------------#
version="0.5" # Version de la ROM (1.0 - 2.0 - etc...).
device="cooperve" # Para informar al usuario del dispositivo el cual soporta la ROM compilada (cooper - cooperve - tass - tassve - ghost - condor - etc...).
build="unofficial" # La build de la ROM (unofficial - official - beta - nightly - snapshot).
date=`date +%Y-%m-%d` # Fecha de la compilacion de la ROM. Esta no se puede editar.
PS3="Please enter the option here: " # Pregunta que opcion quieres (?)
options="Compile Wipe Wipe->Compile Exit" # Opciones

case $(head -n1 /etc/issue | cut -f 1 -d ' ') in # Detectamos Sistema Operativo (Nada importante)
    Debian)     OS="Debian" ;; # Detecta que es Debian
    Ubuntu)     OS="Ubuntu" ;; # Detecta que es Ubuntu
    rhel)     OS="Red Hat Enterprice Linux" ;; # Detecta que es RHel (Centos normalmente)
    elementary)   OS="ElementaryOS";; # Detecta que es ElementaryOS
    *)          OS="Undefined";; #Detecta que el sistema operativo es indefinido
esac
if [[ "$OS" = "Debian" ]]; then
  PKGI = "apt-get install"
elif [[ "$OS" = "Ubuntu" ]]; then
  PKGI = "sudo apt-get install"
elif [[ "$OS" = "Red Hat Enterprice Linux"]]; then
  PKGI = "yum install"
elif [[ "$OS" = "ElementaryOS" ]]; then
  PKGI = "ElementaryOS INSTALLER"
fi
#----------------------------------------------------------#
#                       Compilador                         #
#----------------------------------------------------------#
clear
echo "--------------------------------------"
echo "--------------------------------------"
echo "             Welcome To               "
echo "         CyanBlack Compiler           "
echo "       Operative System: "$OS"         "
echo "          Device: "$device"           "
echo "           Build: "$build"            "
echo "--------------------------------------"
echo "--------------------------------------"
select opt in $options; do
    if [[ "$opt" = "Compile" ]]; then
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      echo "The source will be compiled without 'Zipaling Apps'"
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      zip -r cbos-"$version"-"$date"-"$build"-"$device".zip ./*
    elif [[ "$opt" = "Wipe" ]]; then
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      echo "           The ZIP will be erased...               "
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      rm -f *.zip
    elif [[ "$opt" = "Wipe->Compile" ]]; then
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      echo "The ZIP will be erased and Re-Compiled for Updates."
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      rm -f *.zip
      zip -r cbos-"$version"-"$date"-"$build"-"$device".zip ./*
    elif [[ "$opt" = "Install Dependencies" ]]; then
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      echo "             Installing dependencies               "
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      break
    elif [[ "$opt" = "Exit" ]]; then
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
