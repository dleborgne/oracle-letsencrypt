# oracle-letsencrypt
Using Let's Encrypt to get and renew a TLS certificate to encrypt the TNS traffic between Oracle Database client and server and HTTPS traffic between browser and Oracle Enterprise Manager Database Express. Tested with Oracle Database 12c R2, 18c and 19c.

Certs are obtained with Certbot. The deploy-to-oracledb.sh renewal hook is then triggered to scp PEM files to the Oracle host, and remotely launch the Oracle Wallet creation script.

## deploy-to-oracledb.sh
This script is a Certbot renew hook. It copies PEM files to the Oracle host, and remotely launch the Oracle Wallet creation script.

## renew-wallet.sh
This script takes private key, certificate chain and certificate from PEM files in /home/oracle/tls and create a new Oracle wallet in  ${ORACLE_HOME}/owm/wallets. The wallet name is named after the host.

## create-oracle-client-wallet.bat
This DOS script creates an Oracle client wallet containing Let's Encrypt's root certificate. It requires a *full* Oracle Client as the orapki command is unavailable in Oracle Instant Client.

# JDBC support
Let's Encrypt certificates could be used straightforwardly with Oracle Java 7, but IBM Java 7 (shipped with WebSphere) did not recognize them and required the use of an additionnal trustStore containing the Let's Encrypt's root certificate and javax.net.ssl.trustStore, javax.net.ssl.trustStorePassword and javax.net.ssl.trustStoreType properties.
OpenJDK 7 et Oracle JDK 7 requires the oracle.net.ssl_version=1.2 property.

More information about Let's Encrypt certificate Compatibility can be found in https://letsencrypt.org/docs/certificate-compatibility/
