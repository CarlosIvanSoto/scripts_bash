#!/bin/bash

# Instalar Prometheus
echo "Instalando Prometheus..."
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar -xvf prometheus-2.43.0.linux-amd64.tar.gz
cd prometheus-2.43.0.linux-amd64/
sudo cp prometheus /usr/local/bin/
sudo cp promtool /usr/local/bin/
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo cp -r consoles/ console_libraries/ /etc/prometheus/
sudo cp prometheus.yml /etc/prometheus/
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Instalar Grafana
echo "Instalando Grafana..."
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana

# Configurar Grafana
echo "Configurando Grafana..."
sudo systemctl daemon-reload
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

# Configurar Prometheus como fuente de datos en Grafana
echo "Configurando Prometheus como fuente de datos en Grafana..."
sudo cat <<EOF > /etc/grafana/provisioning/datasources/prometheus.yml
apiVersion: 1
datasources:
- name: Prometheus
  type: prometheus
  url: http://localhost:9090
  access: proxy
  isDefault: true
EOF

# Reiniciar Grafana para aplicar los cambios de configuración
echo "Reiniciando Grafana..."
sudo systemctl restart grafana-server

echo "Instalación completa."
