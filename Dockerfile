FROM alpine:3.6
MAINTAINER Ivan Pedrazas <ipedrazas@gmail.com>
ENV LC_ALL C.UTF-8
ENV COOKIECUTTER_VERSION 1.5.1

RUN apk add --no-cache \
  python \
  python-dev \
  py-pip \
  git \
  openssh \
  openssl \
  g++ && \
  pip install cookiecutter==$COOKIECUTTER_VERSION && \
  apk del g++ py-pip  python-dev && \
  adduser -Dg '' cookiecutter && \
  mkdir -p /.cookiecutter_replay/ && \
  chown cookiecutter:cookiecutter -R /.cookiecutter_replay/

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
  wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
  apk add glibc-2.25-r0.apk && \
  rm -f /glibc-2.25-r0.apk

ENV HUB_VERSION 2.2.9
RUN wget -q https://github.com/github/hub/releases/download/v$HUB_VERSION/hub-linux-amd64-$HUB_VERSION.tgz && \
  tar xzf hub-linux-amd64-$HUB_VERSION.tgz && \
  install /hub-linux-amd64-$HUB_VERSION/bin/hub /usr/local/bin && \
  rm -rf /hub-linux-amd64-$HUB_VERSION /hub-linux-amd64-$HUB_VERSION.tgz

USER cookiecutter
WORKDIR "/srv/app"
ENTRYPOINT [ "cookiecutter" ]
