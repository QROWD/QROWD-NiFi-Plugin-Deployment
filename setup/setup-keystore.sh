#!/bin/bash

# Export the vars in .env into your shell:
export $(egrep -v '^#' .env | xargs)

target="certs"

mkdir -p "$target"

openssl req -x509 -newkey rsa:2048 -keyout "$target/admin-private-key.pem" -out "$target/admin-cert.pem" -days 365 -nodes -config req.conf

openssl pkcs12 -inkey "$target/admin-private-key.pem" -in "$target/admin-cert.pem" -export -out "$target/admin.pfx" -passout pass:"$KEYSTORE_PASSWORD"

keytool -genkeypair -alias nifiserver -keyalg RSA -keypass "$KEYSTORE_PASSWORD" -storepass "$TRUSTSTORE_PASSWORD" -keystore "$target/keystore.jks" -dname "$INITIAL_ADMIN_IDENTITY" -noprompt

keytool -importcert -v -trustcacerts -alias admin -file "$target/admin-cert.pem" -keystore "$target/truststore.jks" -storepass "$TRUSTSTORE_PASSWORD" -noprompt
