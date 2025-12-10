FROM golang:1.25-trixie AS base
RUN echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | tee /etc/apt/sources.list.d/goreleaser.list
RUN dpkg --add-architecture amd64 \
    && dpkg --add-architecture arm64 \
    && dpkg --add-architecture armhf \
    && apt-get update -y

FROM base AS arch-amd64
RUN apt-get install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu gcc-arm-linux-gnueabihf -y

FROM base AS arch-arm64
RUN apt-get install gcc-x86-64-linux-gnu gcc-arm-linux-gnueabihf -y

FROM base AS arch-armhf
RUN apt-get install gcc-aarch64-linux-gnu -y gcc-x86-64-linux-gnu -y

FROM arch-${TARGETARCH} AS final
RUN apt-get install libstdc++-12-dev-amd64-cross libstdc++-12-dev-arm64-cross libstdc++-12-dev-armhf-cross -y \
    && apt-get install build-essential python3-requests curl sed gcc gcc-mingw-w64-x86-64 libolm-dev ca-certificates curl gnupg goreleaser:native nodejs:native npm:native -y


