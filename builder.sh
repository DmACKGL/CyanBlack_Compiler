#!/bin/bash

#Variables
  version="0.5" #version de la ROM (1.0 - 2.0 - etc...).
  device="cooperve" #para informar al usuario del dispositivo al cual soporta el telefono (cooper - cooperve - tass - tassve - ghost - condor - etc...).
  build="unofficial" #la build de la ROM (unofficial - official - beta - nightly - snapshot).
  date=`date +%Y-%m-%d` #fecha de la compilacion de la ROM. Esta no se puede editar.
  PS3="Please enter the option here: "
  options="Compile Wipe Wipe->Compile Exit"
  
#Compilador
echo "--------------------------------------"
echo "--------------------------------------"
echo "             Welcome To               "
echo "         CyanBlack Compiler           "
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
        echo "--------------------------------------"
        echo "--------------------------------------"
        break
    fi
done
