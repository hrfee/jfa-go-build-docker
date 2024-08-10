# Note: appindicator3 is only used for x86-64 builds,
# however pkg-config complains if the native version
# isn't available (i.e. when running on arm64).
FROM golang:bookworm AS base
RUN dpkg --add-architecture amd64 \
    && apt-get update -y

FROM base AS arch-amd64
RUN apt-get install gcc-aarch64-linux-gnu gcc-arm-linux-gnueabihf -y

FROM base AS arch-arm64
RUN apt-get install gcc-x86-64-linux-gnu gcc-arm-linux-gnueabihf -y

FROM base AS arch-armhf
RUN apt-get install gcc-aarch64-linux-gnu -y gcc-x86-64-linux-gnu -y

FROM arch-${TARGETARCH} AS final
RUN apt-get install libayatana-appindicator3-dev:amd64 -y \
    && apt-get install build-essential python3-requests curl software-properties-common sed gcc gcc-mingw-w64-x86-64 libolm-dev ca-certificates curl gnupg -y \
    && curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh && ./nodesource_setup.sh \
    && apt-get update -y \
    && apt-get install nodejs:native -y \
    && npm i -G npm


