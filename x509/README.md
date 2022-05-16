openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 2014 -out rootCA.pem -config CA.conf -extensions v3_ca -subj "/CN=rootCA"


#VAULT
openssl req -new -newkey rsa:2048 -nodes -keyout vault.key -out vault.csr -subj "/CN=localhost"
openssl x509 -req -in vault.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out vault.crt -days 365 -sha256 -extfile vault.conf

#USER
openssl req -new -newkey rsa:2048 -nodes -keyout user.key -out user.csr -subj "/CN=anish"
openssl x509 -req -in user.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out user.crt -days 365 -sha256 -extfile user.conf
