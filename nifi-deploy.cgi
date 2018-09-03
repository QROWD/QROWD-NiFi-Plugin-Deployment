#!/bin/bas

echo "Pull changes"
git pull
echo "Build nars"
mvn clean install
echo "Copy nars to mount"
cp ./target/lib/*.nar ./setup/nars/
echo "Clean up"
mvn cle
