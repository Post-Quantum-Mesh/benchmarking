#!/bin/sh

sudo /usr/local/openssl/apps/openssl req -x509 -new -newkey rsa:2048 -keyout CA_key.pem -out CA_cert.pem -nodes -subj "/CN=localhost" -days 365 -config /usr/local/openssl/apps/openssl.cnf

sudo /usr/local/openssl/apps/openssl req -new -newkey rsa:2048 -keyout serverkey.pem -out servercsr.csr -nodes -subj "/CN=localhost" -config /usr/local/openssl/apps/openssl.cnf

sudo /usr/local/openssl/apps/openssl x509 -req -in servercsr.csr -out servercert.pem -CA CA_cert.pem -CAkey CA_key.pem -CAcreateserial -days 365

sudo chown -R dan *
