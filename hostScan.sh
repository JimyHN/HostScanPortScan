#!/bin/bash


function ctrl_c(){
  echo -e "\n\n[!] Saliendo... \n"
  exit 1
}


#Ctrl+C
trap ctrl_c INT

#TOTAL DE PUERTOS 65535

tput civis #Ocultar cursor
for i in $(seq 1 254);do 
  timeout 1 bash -c "ping -c 1 192.168.1.$i &>/dev/null" && echo "[+] Host 192.168.1.$i - ACTIVE" & # el & es para lanzarlo en forma de hilos
  # timeout 1 bash le damos 1 segundo de vida, ya que en los hosts, si estan activos tardan eneguida en decirlo, y si no, tardan mas, ahorrar tiempo
done; wait

#Recuperamos cursor
tput cnorm
