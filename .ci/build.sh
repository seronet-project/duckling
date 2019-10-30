apt-get update
apt-get install libpcre3-dev -y
stack build --install-ghc
stack install --copy-bins --local-bin-path ../duckling-build