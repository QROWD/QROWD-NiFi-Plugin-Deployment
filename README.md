# QROWD-NiFi-Plugin-Deployment

This repo has a commit hook which reads the pom.xml and installs all referenced nar dependencies at the qrowd nifi installation by invoking
[qrowd server]/cgi-bin/nifi-deploy.cgi

## Deploy a nar plugin directly to the maven repository embedded in this git repository:

```bash
mvn deploy:deploy-file \
  -DgroupId=lib \
  -DartifactId=artifact \
  -Dpackaging=jar \
  -Dversion=1.0.0 \
  -DgeneratePom=true \
  -Dfile=your-artifact-file.nar \
  -Durl=file:///path/to/this/git/m2/repository
```

## Deploy Nifi

1. Rename ./setup/env.dist to .env and change variable
2. `./setup/setup-keystore.sh`
3. `./nifi-deploy.cgi`
4. `docker-compose up -d`
5. Create admin group in nifi
6. Connect Nifi to registry

## Adding a User

1. Add user to ldap group:
   [web2ldap :: ldap://ldap.aksw.org :: dc=aksw,dc=org :: Basic Search Form](https://ldap.aksw.org/web2ldap-k/searchform?ldapurl=ldap%3A%2F%2Fldap.aksw.org%2Fdc%3Daksw%2Cdc%3Dorg%3F%3F%3F%3Fx-starttls%3D2)
2. Add user to nifi group

## Adding a Processor

1. Add artifact to pom
2. `./nifi-deploy.cgi`
3. Add nar to docker-compose.yml
