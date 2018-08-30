FROM alpine:3.8

ENV VERSION 0.6.0

RUN apk --no-cache add \
  curl \
  g++ \
  git \
  gnupg \
  make \
  openssl \
  openssl-dev && \
  curl -L https://github.com/AGWA/git-crypt/archive/$VERSION.tar.gz | tar zxv -C /var/tmp && \
  cd /var/tmp/git-crypt-$VERSION && make && make install PREFIX=/usr/local && \
  rm -rf /var/tmp/*

ENTRYPOINT /usr/local/bin/git-crypt
