FROM multiarch/alpine:armhf-latest-stable
LABEL maintainer "Ruben Jongejan - ruben.jongejan@gmail.com"

RUN apk --no-cache add \
    libc6-compat \
    curl \
    && curl https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz | tar xz \
    && curl https://curl.haxx.se/ca/cacert.pem -o /etc/ssl/certs/cacert.pem \
    && apk del curl \
    && rm -rf /var/cache/apk/*

EXPOSE 53

ENTRYPOINT ["/cloudflared"]
CMD ["proxy-dns", "--address", "0.0.0.0"]
