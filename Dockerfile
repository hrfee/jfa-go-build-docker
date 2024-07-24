FROM golang:bookworm

RUN apt-get update -y \
    && apt-get install build-essential python3-pip curl software-properties-common sed gcc libayatana-appindicator3-dev gcc-mingw-w64-x86-64 gcc-aarch64-linux-gnu gcc-x86-64-linux-gnu libolm-dev ca-certificates curl gnupg -y \
    && curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh && ./nodesource_setup.sh \
    && apt-get update -y \
    && apt-get install nodejs -y \
    && npm i -G npm
