#!/bin/bash

ORACLEDB_DOMAIN=oracledb.example.com
ORACLE_DB_IP=10.0.0.1

if [[ $RENEWED_DOMAINS == *"$ORACLEDB_DOMAIN"* ]]; then
  echo "Deploying new certs for $ORACLEDB_DOMAIN to $ORACLE_DB_IP"
  scp /etc/letsencrypt/live/$ORACLEDB_DOMAIN/*.pem oracle@$ORACLE_DB_IP:/home/oracle/tls/
  ssh oracle@$ORACLE_DB_IP /home/oracle/scripts/renew-wallet.sh
else
  echo "$0 was started for $RENEWED_DOMAINS"
fi
