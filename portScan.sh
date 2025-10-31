#!/bin/bash


function ctrl_c(){
  echo -e "\n\n[!] Saliendo... \n"
  exit 1
}


#Ctrl+C
trap ctrl_c INT

#TOTAL DE PUERTOS 65535

tput civis #Ocultar el cursor
for port in $(seq 1 65535);do 
  (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "[+] $port - OPEN" & # el & es para lanzarlo en forma de hilos independientes para que vaya mas rapido
done; wait

#Recuperamos cursor
tput cnorm
