#!/bin/bash

# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

# *********** Configuring PoshC2 **************
echo "Processing PoshC2 environment variables.."

# *** Server Config ***
SERVER_CONFIG=/var/poshc2/config-template.yml
# BindIP: '0.0.0.0'
if [[ "$BIND_IP" ]]; then
  echo "[+] Setting PoshC2 Bind IP to ${BIND_IP}"
  sed -i "s/^BindIP:.*$/BindIP: '${BIND_IP}'/g" ${SERVER_CONFIG}
fi

# BindPort: 443
if [[ "$BIND_PORT" ]]; then
  echo "[+] Setting PoshC2 Bind port to ${BIND_PORT}"
  sed -i "s/^BindPort:.*$/BindPort: ${BIND_PORT}/g" ${SERVER_CONFIG}
fi

# PoshInstallDirectory: "/opt/PoshC2/"
if [[ "$POSH_INSTALL_DIRECTORY" ]]; then
  echo "[+] Setting PoshC2 install directory to ${POSH_INSTALL_DIRECTORY}"
  sed -i "s|^PoshInstallDirectory:.*$|PoshInstallDirectory: \"${POSH_INSTALL_DIRECTORY}\"|g" ${SERVER_CONFIG}
fi

# PoshProjectDirectory: "/opt/PoshC2_Project/"
if [[ "$POSH_PROJECT_DIRECTORY" ]]; then
  echo "[+] Setting PoshC2 project directory to ${POSH_PROJECT_DIRECTORY}"
  sed -i "s|^PoshProjectDirectory:.*$|PoshProjectDirectory: \"${POSH_PROJECT_DIRECTORY}\"|g" ${SERVER_CONFIG}
fi

# *** Database Config (SQL or Postgres) ***

# DatabaseType: SQLite or Postgres
if [[ "$DATABASE_TYPE" ]]; then
  echo "[+] Setting PoshC2 database type to ${DATABASE_TYPE}"
  sed -i "s/^DatabaseType:.*$/DatabaseType: ${DATABASE_TYPE}/g" ${SERVER_CONFIG}
fi

# PostgresConnectionString: "dbname='poshc2_project_x' port='5432' user='admin' host='192.168.111.111' password='XXXXXXX'"
# Only used if Postgres in use
if [[ "$POSTGRES_CONNECTION_STRING" ]]; then
  echo "[+] Setting PoshC2 PostgresConnectionString to ${POSTGRES_CONNECTION_STRING}"
  sed -i "s/^PostgresConnectionString:.*$/PostgresConnectionString: \"${POSTGRES_CONNECTION_STRING}\"/g" ${SERVER_CONFIG}
fi

# *** Payload Comms ***

# PayloadCommsHost: "https://127.0.0.1"
if [[ "$PAYLOAD_COMMS_HOST" ]]; then
  echo "[+] Setting PoshC2 PayloadCommsHost to ${PAYLOAD_COMMS_HOST}"
  sed -i "s|^PayloadCommsHost:.*$|PayloadCommsHost: \"${PAYLOAD_COMMS_HOST}\"|g" ${SERVER_CONFIG}
fi

# PayloadCommsPort: 443
if [[ "$PAYLOAD_COMMS_PORT" ]]; then
  echo "[+] Setting PoshC2 PayloadCommsPort to ${PAYLOAD_COMMS_PORT}"
  sed -i "s/^PayloadCommsPort:.*$/PayloadCommsPort: ${PAYLOAD_COMMS_PORT}/g" ${SERVER_CONFIG}
fi

# DomainFrontHeader: ""
# example df.azureedge.net
if [[ "$DOMAIN_FRONT_HEADER" ]]; then
  echo "[+] Setting PoshC2 DomainFrontHeader to ${DOMAIN_FRONT_HEADER}"
  sed -i "s/^DomainFrontHeader:.*$/DomainFrontHeader: \"${DOMAIN_FRONT_HEADER}\"/g" ${SERVER_CONFIG}
fi

# Referrer: ""
# optional
if [[ "$REFERRER" ]]; then
  echo "[+] Setting PoshC2 Referrer to ${REFERRER}"
  sed -i "s/^Referrer:.*$/Referrer: \"${REFERRER}\"/g" ${SERVER_CONFIG}
fi

# ServerHeader: "Apache"
if [[ "$SERVER_HEADER" ]]; then
  echo "[+] Setting PoshC2 ServerHeader to ${SERVER_HEADER}"
  sed -i "s/^ServerHeader:.*$/ServerHeader: \"${SERVER_HEADER}\"/g" ${SERVER_CONFIG}
fi

# UserAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"
# This should be updated to match the environment, this is Chrome on 2020-03-2
if [[ "$USER_AGENT" ]]; then
  echo "[+] Setting PoshC2 UserAgent to ${USER_AGENT}"
  sed -i "s/^UserAgent:.*$/UserAgent: \"${USER_AGENT}\"/g" ${SERVER_CONFIG}
fi

# DefaultSleep: "5s"
if [[ "$DEFAULT_SLEEP" ]]; then
  echo "[+] Setting PoshC2 DefaultSleep to ${DEFAULT_SLEEP}"
  sed -i "s/^DefaultSleep:.*$/DefaultSleep: \"${DEFAULT_SLEEP}\"/g" ${SERVER_CONFIG}
fi

# Jitter: 0.20
if [[ "$JITTER" ]]; then
  echo "[+] Setting PoshC2 Jitter to ${JITTER}"
  sed -i "s/^Jitter:.*$/Jitter: ${JITTER}/g" ${SERVER_CONFIG}
fi

# KillDate: "01/06/2020"
# dd/MM/yyyy
if [[ "$KILL_DATE" ]]; then
  echo "[+] Setting PoshC2 KillDate to ${KILL_DATE}"
  sed -i "s/^KillDate:.*$/KillDate: \"${KILL_DATE}\"/g" ${SERVER_CONFIG}
fi

# Beacon URLs will be taken from resources/urls.txt if value is 'urls'. If value is 'wordlists' beacon URLs will be randomly generated on server creation from resources/wordlist.txt
if [[ "$URL_CONFIG" ]]; then
  echo "[+] Setting PoshC2 UrlConfig to ${URL_CONFIG}"
  sed -i "s/^UrlConfig:.*$/UrlConfig: \"${URL_CONFIG}\"/g" ${SERVER_CONFIG}
fi

# *** Payload Options ***

# DefaultMigrationProcess: "C:\\Windows\\system32\\netsh.exe"
# Used in the PoshXX_migrate.exe payloads
if [[ "$DEFAULT_MIGRATION_PROCESS" ]]; then
  echo "[+] Setting PoshC2 DefaultMigrationProcess to ${DEFAULT_MIGRATION_PROCESS}"
  sed -i "s/^DefaultMigrationProcess:.*$/DefaultMigrationProcess: \"${DEFAULT_MIGRATION_PROCESS}\"/g" ${SERVER_CONFIG}
fi

# *** Notifications Options ***

# Sounds: "No"
if [[ "$SOUNDS" ]]; then
  echo "[+] Setting PoshC2 Sounds to ${SOUNDS}"
  sed -i "s/^Sounds:.*$/Sounds: \"${SOUNDS}\"/g" ${SERVER_CONFIG}
fi

# NotificationsProjectName: "PoshC2"
if [[ "$NOTIFICATIONS_PROJECT_NAME" ]]; then
  echo "[+] Setting PoshC2 NotificationsProjectName to ${NOTIFICATIONS_PROJECT_NAME}"
  sed -i "s/^NotificationsProjectName:.*$/NotificationsProjectName: \"${NOTIFICATIONS_PROJECT_NAME}\"/g" ${SERVER_CONFIG}
fi

# EnableNotifications: "No"
if [[ "$ENABLE_NOTIFICATIONS" ]]; then
  echo "[+] Setting PoshC2 EnableNotifications to ${ENABLE_NOTIFICATIONS}"
  sed -i "s/^EnableNotifications:.*$/EnableNotifications: \"${ENABLE_NOTIFICATIONS}\"/g" ${SERVER_CONFIG}
fi

# *** Pushover - https://pushover.net/ ***

# Pushover_APIToken: ""
if [[ "$PUSHOVER_APITOKEN" ]]; then
  echo "[+] Setting PoshC2 Pushover_APIToken to ${PUSHOVER_APITOKEN}"
  sed -i "s/^Pushover_APIToken:.*$/Pushover_APIToken: \"${PUSHOVER_APITOKEN}\"/g" ${SERVER_CONFIG}
fi

# Pushover_APIUser: ""
if [[ "$PUSHOVER_APIUSER" ]]; then
  echo "[+] Setting PoshC2 Pushover_APIUser to ${PUSHOVER_APIUSER}"
  sed -i "s/^Pushover_APIUser:.*$/Pushover_APIUser: \"${PUSHOVER_APIUSER}\"/g" ${SERVER_CONFIG}
fi

# ** SOCKS Proxying Options **

# SocksHost: "http://127.0.0.1:49031"
if [[ "$SOCKS_HOST" ]]; then
  echo "[+] Setting PoshC2 SocksHost to ${SOCKS_HOST}"
  sed -i "s|^SocksHost:.*$|SocksHost: \"${SOCKS_HOST}\"|g" ${SERVER_CONFIG}
fi

echo " "
echo "[+] Local conf file:"
cat ${SERVER_CONFIG}
echo " "

exec "$@"