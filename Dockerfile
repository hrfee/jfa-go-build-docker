FROM golang:buster

RUN apt-get update -y \
    && apt-get install build-essential python3-pip curl software-properties-common sed upx gcc libgtk-3-dev libayatana-appindicator3-dev gcc-mingw-w64-x86-64 libolm-dev -y \
    && bash -c 'curl -sL https://deb.nodesource.com/setup_current.x | bash -' && apt-get install nodejs -y && npm i -G npm
