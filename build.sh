#!/bin/bash
declare -a VERSIONS=('5.6' '7.0')

for i in "${VERSIONS[@]}"
do
  sed "s/\$VERSION/$i/g" Dockerfile > ./dist/$i/Dockerfile
  cp -R ./bin ./dist/$i/
  cp -R ./conf ./dist/$i/
done
