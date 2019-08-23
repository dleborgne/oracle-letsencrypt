#!/bin/bash

source $(dirname $0)/setEnv.sh

TMP_DIR=$(mktemp -d)

# Stop listener
lsnrctl stop

# Delete old wallet
rm -rf ${ORACLE_HOME}/owm/wallets/$(hostname -s)

# Create new empty wallet
orapki wallet create -wallet ${ORACLE_HOME}/owm/wallets/$(hostname -s) \
                     -auto_login -pwd ********************************

# Create PKCS12 file with new certs and keys
openssl pkcs12 -export -out ${TMP_DIR}/$(hostname -s).p12 \
                       -inkey /home/oracle/tls/privkey.pem \
                       -in /home/oracle/tls/cert.pem \
                       -certfile /home/oracle/tls/chain.pem \
                       -passout pass:********************************

# Import PKCS12 content into oracle wallet
orapki wallet import_pkcs12 -wallet ${ORACLE_HOME}/owm/wallets/$(hostname -s) \
                            -pwd paM9Ndfy264HZEZn9ldkA4zra801qqen \
                            -pkcs12file ${TMP_DIR}/$(hostname -s).p12\
                            -pkcs12pwd ********************************

# Cleanup
rm -rf ${TMP_DIR}

# Start listener
lsnrctl start
