FROM nginx:alpine@sha256:455c39afebd4d98ef26dd70284aa86e6810b0485af5f4f222b19b89758cabf1e

ARG NOVNC_VERSION=v1.3.0

RUN apk update && apk add git

RUN git clone -c advice.detachedHead=false --depth=1 --branch ${NOVNC_VERSION} https://github.com/novnc/noVNC /novnc

COPY nginx.conf /etc/nginx/templates/default.conf.template

EXPOSE 80

ENV ACCESS_LOG=/var/log/nginx/access.log
ENV ERROR_LOG=/var/log/nginx/error.log
ENV RESOLVER=127.0.0.11
ENV BASE_PATH=/