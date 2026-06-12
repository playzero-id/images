#!/bin/ash

TZ=${TZ:-UTC}
export TZ

INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

cd /home/container || exit 1

PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

printf "\033[1m\033[38;5;117m❄ zero\033[38;5;253m@\033[38;5;117mdactyl \033[38;5;14m~ \033[0m%s\n" "$PARSED"

exec env ${PARSED}
