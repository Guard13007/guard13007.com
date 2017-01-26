#!/bin/bash

set -o errexit   # exit on error

# Prerequisites
echo "Please set up certificates before continuing."
read -p " Press [Enter] to continue, or Ctrl+C to cancel."
sudo apt-get update
sudo apt-get install wget curl lua5.1 liblua5.1-0-dev zip unzip libreadline-dev libncurses5-dev libpcre3-dev openssl libssl-dev perl make build-essential postgresql -y
# Make sure you note your PostgreSQL password!

# OpenResty
cd ..
OVER=1.11.2.2
wget https://openresty.org/download/openresty-$OVER.tar.gz
tar xvf openresty-$OVER.tar.gz
cd openresty-$OVER
./configure
make
sudo make install
cd ..

# LuaRocks
LVER=2.4.2
wget https://keplerproject.github.io/luarocks/releases/luarocks-$LVER.tar.gz
tar xvf luarocks-$LVER.tar.gz
cd luarocks-$LVER
./configure
make build
sudo make install
# some rocks
sudo luarocks install lapis
sudo luarocks install moonscript
sudo luarocks install bcrypt
#sudo luarocks install --server=http://luarocks.org/dev lapis-systemd

# cleanup
cd ..
rm -rf openresty*
rm -rf luarocks*

# okay now let's set it up
cd guard13007.com
openssl dhparam -out dhparams.pem 2048
echo "Changing user to postgres..."
echo "Run 'psql', enter the following (using a real password of course):"
echo "ALTER USER postgres WITH PASSWORD 'password';"
echo "\q"
echo "Then run 'createdb guard13007com' and then 'exit' !"
echo "'createdb devguard13007com' for development database!"
sudo -i -u postgres
cp secret.moon.example secret.moon
nano secret.moon   # Put the info needed in there!
moonc .
lapis migrate production

# guard13007.com as a service
echo "[Unit]
Description=guard13007.com server

[Service]
Type=forking
WorkingDirectory=$(pwd)
ExecStart=$(which lapis) server production
ExecReload=$(which lapis) build production
ExecStop=$(which lapis) term

[Install]
WantedBy=multi-user.target" > guard13007com.service
sudo cp ./guard13007com.service /etc/systemd/system/guard13007com.service
sudo systemctl daemon-reload
sudo systemctl enable guard13007com.service
service guard13007com start
#lapis systemd service production --install
#lapis systemd service development --install
echo "(Don't forget to proxy or pass to port 8150!)"
#echo "I'm expecting you to want to start the production service now."
#echo "Press Ctrl+C to cancel! (Remember sudo service guard13007.com start)"
