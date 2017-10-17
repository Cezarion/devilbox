#!/bin/sh

SRC=$(cd $(dirname "$0"); pwd)

# Colors
BLUE=$'\e[36;01m'
NORMAL=$'\e[0m'

WEB_PATH="${SRC}/../www-docker"

echo "${BLUE} Create Webserver Path in ${SRC}/../www-docker ${NORMAL}"
mkdir -p "${WEB_PATH}"

echo ""

# Put local environement into
echo "${BLUE} Put Webserver path into .env  ${NORMAL}";

ORI_DIR='./data/www';

echo "${BLUE} Write local environnement into ${DIR}/../www-docker/.devilbox ${NORMAL}";


echo "# This file is generated automatically, does not edit or does not restart the install.sh script in Devilbox" > "${HOME}/.devilbox"
echo "HOST_PATH_HTTPD_DATADIR=${WEB_PATH}" >> "${HOME}/.devilbox"
echo "DEVILBOX_LOCAL_PATH=${SRC}" >> "${HOME}/.devilbox"
