FROM golang:bookworm

# Note: appindicator3 is only used for x86-64 builds,
# however pkg-config complains if the native version
# isn't available (i.e. when running on arm64).

RUN dpkg --add-architecture amd64 \
    && apt-get update -y \
    && apt-get install libayatana-appindicator3-dev:amd64 libayatana-appindicator3-dev:arm64 -y \
    && arch="$(dpkg --print-architecture)" \
    && case "$arch" in \
         amd64) apt-get install gcc-aarch64-linux-gnu:native -y ;; \
         arm64) apt-get install gcc-x86-64-linux-gnu:native -y ;; \
       esac; \
    apt-get install build-essential:native python3-pip:native curl:native software-properties-common:native sed:native gcc:native gcc-mingw-w64-x86-64:native libolm-dev:native ca-certificates:native curl:native gnupg:native -y \
    && curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh && ./nodesource_setup.sh \
    && apt-get update -y \
    && apt-get install nodejs:native -y \
    && npm i -G npm
