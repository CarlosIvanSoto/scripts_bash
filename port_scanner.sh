#!/bin/bash
sudo apt-get install nmap

echo "Obteniendo dirección IP pública..."
ip=$(curl -s ifconfig.me)
echo "Tu dirección IP pública es: $ip"

echo "Escaneando los puertos más comunes..."
ports="21,22,23,25,53,80,110,135,139,143,443,445,993,995,1723,3306,3389,5900,8080"
echo "Puertos a escanear: $ports"

echo "Escaneando puertos..."
nmap -Pn -T2 -p $ports $ip
