#!/bin/bash
set -x

apt-get update
apt-get install libpcre3-dev -y

cd ./github-seronet
stack build --install-ghc
stack install --copy-bins --local-bin-path ../duckling-build
cd -
cp ./github-seronet/.ci/manifest.yml ./duckling-build/manifest.yml
ls ./duckling-build
