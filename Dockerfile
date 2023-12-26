FROM golang:buster

RUN apt-get update -y \
    && apt-get install build-essential python3-pip curl software-properties-common sed upx gcc libgtk-3-dev libayatana-appindicator3-dev gcc-mingw-w64-x86-64 libolm-dev ca-certificates curl gnupg -y \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSl https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_21.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
    && apt-get update -y \
    && apt-get install nodejs -y \
    && npm i -G npm
