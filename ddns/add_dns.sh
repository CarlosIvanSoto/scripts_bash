#!/bin/bash

#################### CHANGE THE FOLLOWING VARIABLES ####################
source .env
########################################################################
CURRENT_IPV4="$(curl -s ifconfig.me)"

echo "IP has changed: $CURRENT_IPV4"
echo "$(date),$CURRENT_IPV4" >> "$LOG_FILE"

# echo "ip: $CURRENT_IPV4, token: $DIGITALOCEAN_TOKEN, name: $NAME, domain: $DOMAIN" >> "$LOG_FILE"
# curl -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" -d '{"data":"'"$CURRENT_IPV4"'"}' "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$RECORD_ID"
# curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" -d '{"type":"A","name":"'"$NAME"'"","data":"'"$CURRENT_IPV4"'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/$DOMAIN/records"
curl --location "https://api.digitalocean.com/v2/domains/$DOMAIN/records" \
-H 'Authorization: Bearer '"$DIGITALOCEAN_TOKEN" \
-H 'Content-Type: application/json' \
-d '{
    "type": "A",
    "name": "'"$NAME"'",
    "data": "'"$CURRENT_IPV4"'",
    "priority": null,
    "port": null,
    "ttl": 1800,
    "weight": null,
    "flags": null,
    "tag": null
}'