FROM golang:bookworm

# Note: appindicator3 is only used for x86-64 builds,
# however pkg-config complains if the native version
# isn't available (i.e. when running on arm64).

RUN dpkg --add-architecture amd64 \
    && apt-get update -y \
    && apt-get install libayatana-appindicator3-dev:amd64 -y \
    && arch=$(dpkg --print-architecture); if [[ "$arch" == "amd64" ]]; then apt-get install gcc-aarch64-linux-gnu -y; else apt-get install gcc-x86-64-linxu-gnu -y; fi; \
    apt-get install build-essential python3-pip curl software-properties-common sed gcc gcc-mingw-w64-x86-64 libolm-dev ca-certificates curl gnupg -y \
    && curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh && ./nodesource_setup.sh \
    && apt-get update -y \
    && apt-get install nodejs:native -y \
    && npm i -G npm
