FROM docker.io/alpine:3.24 AS buildbase

RUN apk upgrade --update --no-cache
RUN apk add --update --no-cache clang llvm lld cmake make pkgconf gcompat
RUN apk add --update --no-cache build-base flex bison cargo

LABEL org.opencontainers.image.source=https://github.com/XboxDev/nxdk-buildbase


FROM docker.io/alpine:3.24 AS runbase

RUN apk upgrade --update --no-cache
RUN apk add --update --no-cache clang llvm lld cmake make pkgconf gcompat

LABEL org.opencontainers.image.source=https://github.com/XboxDev/nxdk-buildbase
