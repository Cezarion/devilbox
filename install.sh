#!/bin/sh

SRC=$(cd $(dirname "$0"); pwd)

# Colors
readonly BLUE=$'\e[36;01m'
readonly NORMAL=$'\e[0m'
readonly YELLOW=$'\e[33;01m'

WEB_PATH="${SRC}/../www-docker"

echo ""

echo "${BLUE} Create Webserver Path in ${SRC}/../www-docker ${NORMAL}"
mkdir -p "${WEB_PATH}"

echo ""

# Put local environement into
echo "${BLUE} Put Webserver path into .env  ${NORMAL}";

cp env-code-sample .env
sed -i '' "s|HOST_PATH_HTTPD_DATADIR=./data/www|HOST_PATH_HTTPD_DATADIR=${WEB_PATH}|g" .env

echo "${BLUE} Write local environnement into ${HOME}/.devilbox ${NORMAL}";

echo "# This file is generated automatically, does not edit or does not restart the install.sh script in Devilbox" > "${HOME}/.devilbox"
echo "HOST_PATH_HTTPD_DATADIR=${WEB_PATH}" >> "${HOME}/.devilbox"
echo "DEVILBOX_LOCAL_PATH=${SRC}" >> "${HOME}/.devilbox"

echo ""

if [ -f "${WEB_PATH}/.devilbox" ]; then
  echo "${YELLOW} Remove old devilbox config into ${DIR}/../www-docker/.devilbox ${NORMAL}";
  rm "${WEB_PATH}/.devilbox"
fi
