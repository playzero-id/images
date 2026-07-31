#!/bin/bash
cd /home/container

# Print PlayZero.id boot banner
printf "\033[1m\033[38;5;117m❄ PlayZero.id\033[0m\033[38;5;253m  │  tz: %s\033[0m\n" "${TZ:-UTC}"

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
