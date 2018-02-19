FROM alpine:3.7

ENV VERSION 0.6.0

RUN apk --update add \
   curl \
   g++ \
   make \
   openssl \
   openssl-dev \
   && rm -rf /var/cache/apk/*

RUN curl -L https://github.com/AGWA/git-crypt/archive/$VERSION.tar.gz | tar zxv -C /var/tmp
RUN cd /var/tmp/git-crypt-$VERSION && make && make install PREFIX=/usr/local

ENTRYPOINT /usr/local/bin/git-crypt
