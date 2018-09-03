# QROWD-NiFi-Plugin-Deployment

This repo has a commit hook which reads the pom.xml and installs all referenced nar dependencies at the qrowd nifi installation by invoking
[qrowd server]/cgi-bin/nifi-deploy.cgi

## Deploy Nifi

1. Rename ./setup/env.dist to .env and change variable
2. `./setup/setup-keystore.sh`
3. `./nifi-deploy.cgi`
4. `docker-compose up -d`
5. Create admin group in nifi
6. Connect Nifi to registry

## Adding a User

1. Add user to ldap
2. Add user to nifi group

## Adding a Processor

1. Add artifact to pom
2. `./nifi-deploy.cgi`
3. Add nar to docker-compose.ym
