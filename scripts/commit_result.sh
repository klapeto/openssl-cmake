#!/bin/bash
# usage: <architecture> <directory>

cd openssl-prebuilts
git checkout master
git branch $1
git checkout $1

rm -R $1/* || mkdir $1
cp -R ../$2/bin $1
cp -R ../$2/lib $1
cp -R ../$2/include $1
cp -R ../$2/ssl $1

git add $1
git commit -m "Automatically built by slave ($BUILD_OPENSSL_VERSION)" > /dev/null
git push --set-upstream origin $1