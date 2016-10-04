# https://github.com/travis-ci/travis.rb#installation

FROM alpine:edge

# forked from https://github.com/andredumas/docker-travis-ci-cli
# MAINTAINER André Dumas
# MAINTAINER Antón R. Yuste
MAINTAINER Arco van den Heuvel

RUN addgroup web && adduser -D -H -G web travis
USER travis

RUN apk --update add \
  ca-certificates \
  ruby \
  ruby-bundler \
  ruby-dev && \
  rm -fr /usr/share/ri

RUN apk add --no-cache make gcc libc-dev git libffi-dev && \
  rm -fr /usr/share/ri

RUN gem install travis --no-rdoc --no-ri

# Location where travis config stored
ENV TRAVIS_CONFIG_PATH /travis
VOLUME /travis

# Generally the current working dir will be used as the repo volume
VOLUME /repo
WORKDIR /repo

ENTRYPOINT ["/usr/bin/travis"]
