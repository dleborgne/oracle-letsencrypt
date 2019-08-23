cd /d C:\oracle\product\12.1.0\client_1
rmdir /s/q C:\oracle\product\12.1.0\client_1\oracle-client-wallet
wget --no-check-certificate https://letsencrypt.org/certs/isrgrootx1.pem.txt
orapki wallet create -wallet oracle-client-wallet  -pwd ********************************
orapki wallet add -wallet oracle-client-wallet -cert isrgrootx1.pem.txt -trusted_cert -pwd ********************************
orapki wallet create -wallet oracle-client-wallet  -pwd ******************************** -auto_login
del /q isrgrootx1.pem.txt
