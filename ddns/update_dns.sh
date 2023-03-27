#!/bin/bash

#################### CHANGE THE FOLLOWING VARIABLES ####################
source .env
########################################################################
CURRENT_IPV4="$(curl -s ifconfig.me)"
# CURRENT_IPV4="$(dig +short myip.opendns.com @resolver1.opendns.com)"
LAST_IPV4="$(tail -1 $LOG_FILE | awk -F, '{print $2}')"
echo "LAST IP: ($LAST_IPV4)"

if [ "$CURRENT_IPV4" = "$LAST_IPV4" ]; then
    echo "IP has not changed ($CURRENT_IPV4)"
else
    echo "IP has changed: $CURRENT_IPV4"
    echo "$(date),$CURRENT_IPV4" >> "$LOG_FILE"
    # curl -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" -d '{"data":"'"$CURRENT_IPV4"'"}' "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$RECORD_ID"
    curl -X PATCH \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
        -d '{"data":"'"$CURRENT_IPV4"'"}' \
        "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$RECORD_ID"
fi