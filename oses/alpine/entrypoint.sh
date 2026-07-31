#!/bin/ash

TZ=${TZ:-UTC}
export TZ

INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

cd /home/container || exit 1

printf "\033[1m\033[38;5;117m❄ PlayZero.id\033[0m\033[38;5;253m  │  tz: %s\033[0m\n" "${TZ:-UTC}"

PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

printf "\033[1m\033[38;5;117m▶ play\033[38;5;253m@\033[38;5;117mzero \033[38;5;14m~ \033[0m%s\n" "$PARSED"

exec env ${PARSED}
