FROM alpine:3.22 AS buildbase

RUN apk add --update --no-cache clang llvm lld cmake make pkgconf
RUN apk add --update --no-cache build-base flex bison cargo

LABEL org.opencontainers.image.source https://github.com/XboxDev/nxdk-buildbase


FROM alpine:3.22 AS runbase

RUN apk add --update --no-cache clang llvm lld cmake make pkgconf

LABEL org.opencontainers.image.source https://github.com/XboxDev/nxdk-buildbase
