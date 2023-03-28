## scripts_bash

### Para dale permisos de ejecucion a un .sh
    chmod +x install_docker.sh

### Para ejecutar un .sh 
    ./install_docker.sh

## se necesita tener instalado docker compose 

### Para ejecutar los contenedores
    docker-compose up -d

### Si deseas detener y eliminar los contenedores
    docker-compose down

## Otros 

### Para usar Port scanner (public) Tener installado el programa nmap
    sudo apt-get install nmap

### Para usar Port analizer (private) Tener instalado el programa netstat
    sudo apt-get install net-tools

### Para usar red scanner 
    sudo apt-get install nmap awk dnsutils net-tools
