FROM docker.io/library/alpine:3.15 as runtime

RUN \
  apk add --update --no-cache \
    bash \
    curl \
    ca-certificates \
    tzdata

ENTRYPOINT ["appcat-sli-exporter"]
COPY appcat-sli-exporter /usr/bin/

USER 65536:0
