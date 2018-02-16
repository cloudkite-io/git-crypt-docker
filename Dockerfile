FROM alpine:3.6
MAINTAINER Adilet Maratov <adilet.maratov@gmail.com>

ENV VERSION 0.5.0-2

RUN apk --update add \
   bash \
   curl \
   git \
   g++ \
   make \
   openssh \
   openssl \
   openssl-dev \
   && rm -rf /var/cache/apk/*

RUN curl -L https://github.com/AGWA/git-crypt/archive/debian/$VERSION.tar.gz | tar zxv -C /var/tmp
RUN cd /var/tmp/git-crypt-debian-$VERSION && make && make install PREFIX=/usr/local

RUN mkdir -p /repo
WORKDIR /repo

CMD pwd
