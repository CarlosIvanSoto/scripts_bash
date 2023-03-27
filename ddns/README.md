## Dinamyc DNS

### 1. Asegúrate de que el script tenga permisos de ejecución:
    chmod +x check_ip_dns.sh

### 2. Ejecuta el script en segundo plano usando nohup y &:
    nohup ./check_ip_dns.sh &


### Si deseas comprobar que el script se está ejecutando, puedes utilizar el comando ps:
    ps aux | grep check_ip_dns.sh

### Si en algún momento deseas detener el script, puedes utilizar el comando kill con el ID del proceso que obtuviste con el comando ps:
    kill [process_id]

