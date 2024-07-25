FROM golang:bookworm

RUN dpkg --add-architecture amd64 \
    && apt-get update -y \
    && apt-get install libayatana-appindicator3-dev:amd64 -y \
    && apt-get install build-essential:native python3-pip:native curl:native software-properties-common:native sed:native gcc:native gcc-mingw-w64-x86-64:native gcc-aarch64-linux-gnu:native gcc-x86-64-linux-gnu:native libolm-dev:native ca-certificates:native curl:native gnupg:native -y \
    && curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh && ./nodesource_setup.sh \
    && apt-get update -y \
    && apt-get install nodejs:native -y \
    && npm i -G npm
