#!/bin/bash

SCRIPT_DIR=$(dirname $0)
USER=$1
PASSWORD=$2
FILEPATH_HTPASSWD="${SCRIPT_DIR}/auth/htpasswd"

mkdir -p $(dirname "${FILEPATH_HTPASSWD}")

auth_entry=$(docker run --entrypoint htpasswd httpd:2 -Bbn "${USER}" "${PASSWORD}")

echo "${auth_entry} # $(date "+%Y-%m-%d %H:%M:%S")" >> "${SCRIPT_DIR}/auth/htpasswd"