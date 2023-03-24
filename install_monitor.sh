#!/bin/bash

# Crear red de Docker para Prometheus y Grafana
docker network create monitor-net

# Descargar e instalar el contenedor de Prometheus
docker run --name prometheus -d --network monitor-net -p 127.0.0.1:9090:9090 -v /path/to/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

# Descargar e instalar el contenedor de Grafana
docker run -d --name=grafana --network monitor-net -p 3000:3000 grafana/grafana-oss
