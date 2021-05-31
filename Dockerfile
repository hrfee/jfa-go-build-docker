FROM golang:latest

RUN apt-get update -y \
    && apt-get install build-essential python3-pip curl software-properties-common sed upx gcc libgtk-3-dev libappindicator3-dev gcc-mingw-w64-x86-64 -y
RUN curl -sL https://deb.nodesource/setup_14.x | bash -
RUN apt-get install nodejs
