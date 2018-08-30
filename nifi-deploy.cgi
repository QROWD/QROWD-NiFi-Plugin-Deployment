#!/bin/bash

# Needed to avoid apache error message about malformed headers
echo ""

repoPath="/tmp/nifi/plugins/repo"

if cd "$repoPath"; then git pull; else git clone "https://github.com/QROWD/QROWD-NiFi-Plugin-Deployment.git" "$repoPath"; fi

cd "$repoPath"
mvn clean install

cp "$repoPath"/target/lib/*.nar /tmp

echo "Done."


