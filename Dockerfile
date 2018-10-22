FROM alpine

RUN apk update && apk add --no-cache alpine-sdk

RUN mkdir -p /var/cache/distfiles && \
    adduser -D apkmaker && \
    addgroup apkmaker abuild && \
    chgrp abuild /var/cache/distfiles && \
    chmod g+w /var/cache/distfiles && \
    echo "apkmaker    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY bin/make-apk /home/apkmaker/bin/make-apk
# TODO: customize /etc/abuild.conf

WORKDIR /working
USER    apkmaker
