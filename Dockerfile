FROM alpine:3.17 AS buildbase

RUN apk add --update --no-cache clang llvm lld cmake make
RUN apk add --update --no-cache build-base flex bison

LABEL org.opencontainers.image.source https://github.com/XboxDev/nxdk-buildbase


FROM alpine:3.17 AS runbase

RUN apk add --update --no-cache clang llvm lld cmake make

# Download and install glibc
RUN GLIBC_VERSION="2.34-r0" && \
    apk add --update --no-cache curl && \
    curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    curl -Lo glibc.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
    apk add --force-overwrite glibc.apk && \
    apk del curl && \
    rm -rf glibc.apk

LABEL org.opencontainers.image.source https://github.com/XboxDev/nxdk-buildbase
