# oracle-letsencrypt
Using Let's Encrypt to get and renew a TLS certificate used to encrypt TNS and HTTPS trafic with Oracle Database. Tested with Oracle Database 12c, 18c and 19c.

Cert is obtained with certbot running on a different host. A renewal hook copies PEM files to the Oracle host, and the calls the renew-wallet.sh script
