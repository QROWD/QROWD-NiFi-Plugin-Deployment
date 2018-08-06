#!/bin/bash

initialAdmin="/CN=Claus Stadler/OU=People/DC=aksw/DC=org"
nifiAdmin="CN=nifi"

keyPass="changeit"
storePass="changeit"

#/CN=NiFi Admin/C=DE/L=Leipzig

target="target/certs"
mkdir -p "$target"

openssl req -x509 -newkey rsa:2048 -keyout "$target/admin-private-key.pem" -out "$target/admin-cert.pem" -days 365 -subj "$initialAdmin" -nodes

openssl pkcs12 -inkey "$target/admin-private-key.pem" -in "$target/admin-cert.pem" -export -out "$target/admin.pfx" -passout pass:"$keyPass"

keytool -genkeypair -alias nifiserver -keyalg RSA -keypass "$keyPass" -storepass "$storePass" -keystore "$target/keystore.jks" -dname "$nifiAdmin" -noprompt

keytool -importcert -v -trustcacerts -alias admin -file "$target/admin-cert.pem" -keystore "$target/truststore.jks" -storepass "$storePass" -noprompt

