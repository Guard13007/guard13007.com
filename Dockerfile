FROM openresty/openresty:1.15.8.2-6-xenial

LABEL maintainer = "Tangent/Rose <tangentfoxy@gmail.com>"

EXPOSE 80
WORKDIR /app
ENTRYPOINT ["sh", "-c", "sleep 5 && lapis migrate production && lapis server production"]

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install libssl-dev git -y
# RUN sudo apt-get install wget curl lua5.1 liblua5.1-0-dev zip unzip libreadline-dev libncurses5-dev libpcre3-dev openssl libssl-dev perl make build-essential nginx -y

# RUN luarocks install luacrypto
RUN luarocks install lapis
RUN luarocks install luacrypto # no idea why this is still required, it should not be
RUN luarocks install bcrypt
RUN luarocks install lapis-console
RUN luarocks install lua-cjson
RUN luarocks install markdown # might not be needed?

# clean up
RUN apt-get autoremove -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . .
RUN luarocks install moonscript
RUN moonc .
