# oracle-letsencrypt
Using Let's Encrypt to get and renew a TLS certificate used to encrypt TNS and HTTPS trafic with Oracle Database. Tested with Oracle Database 12c, 18c and 19c.

Cert is obtained with Certbot on a host. The deploy-to-oracledb.sh renewal hook is the triggered to scp PEM files to the Oracle host, and remotely launch the Oracle Wallet creation script.

## deploy-to-oracledb.sh
This script is a Certbot renew hook. It copies PEM files to the Oracle host, and remotely launch the Oracle Wallet creation script.

## renew-wallet.sh
This script takes private key, certificate chain and certificate from PEM files in /home/oracle/tls and create a new Oracle wallet in  ${ORACLE_HOME}/owm/wallets. The wallet name is named after the host.

## create-oracle-client-wallet.bat
This DOS script creates an Oracle client wallet containing Let's Encrypt's root certificate. It requires a *full* Oracle Client as the orapki command is unavailable in Oracle Instant Client
