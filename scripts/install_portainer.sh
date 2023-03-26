# Descargar e instalar Portainer
sudo docker volume create portainer_data
sudo docker run -d --name portainer --restart always -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# Habilitar el firewall para el puerto 9000
sudo ufw allow 9000/tcp