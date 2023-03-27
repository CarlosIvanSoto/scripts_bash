#!/bin/bash

echo "Puertos abiertos en el sistema:"
echo "================================="
netstat -tuln | grep -E 'Proto|LISTEN'

echo ""
echo "Servicios asociados a los puertos:"
echo "=================================="
for port in $(netstat -tuln | grep 'LISTEN' | awk '{print $4}' | awk -F ":" '{print $2}' | sort -u); do
    echo "Servicio en el puerto $port: $(lsof -i :$port | grep -v "PID")"
done
