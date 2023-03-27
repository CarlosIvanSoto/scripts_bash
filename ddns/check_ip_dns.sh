#!/bin/bash

#################### CHANGE THE FOLLOWING VARIABLES ####################
source .env
########################################################################

LOG_FILE="ip_log.csv"
INTERVAL=600 # Intervalo en segundos (600 segundos = 10 minutos)

function get_current_ipv4() {
    curl -s ifconfig.me
}

function get_last_ipv4() {
    tail -1 "$LOG_FILE" | awk -F, '{print $2}'
}

function update_ip_record() {
    local new_ip=$1
    curl -X PATCH \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
        -d "{\"data\":\"$new_ip\"}" \
        "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$RECORD_ID"
}

while true; do
    CURRENT_IPV4=$(get_current_ipv4)
    LAST_IPV4=$(get_last_ipv4)

    if [ "$CURRENT_IPV4" = "$LAST_IPV4" ]; then
        echo "IP has not changed ($CURRENT_IPV4)"
    else
        echo "IP has changed: $CURRENT_IPV4"
        echo "$(date),$CURRENT_IPV4" >> "$LOG_FILE"
        update_ip_record "$CURRENT_IPV4"
    fi

    sleep "$INTERVAL"
done
