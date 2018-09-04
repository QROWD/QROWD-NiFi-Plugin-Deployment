#!/bin/bash

# Needed to avoid apache error message about malformed headers
echo ""

confFile="nifi-deploy.conf"

# By default, assume nifi-deploy is a symbolic link into a git repo
if [ -z "repoPath" ]; then
  repoPath=$(dirname $(readlink -f "$0"))
fi

# Load a config if available
test -f "$confFile" && source "$confFile"


#repoPath="/tmp/nifi/plugins/repo"

if cd "$repoPath"; then git pull; else git clone "https://github.com/QROWD/QROWD-NiFi-Plugin-Deployment.git" "$repoPath"; fi

cd "$repoPath"
mvn clean install

mkdir /tmp/nar
cp "$repoPath"/target/lib/*.nar /tmp/nar

echo "Done."
