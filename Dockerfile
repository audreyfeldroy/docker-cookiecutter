FROM alpine:3.2
MAINTAINER Ivan Pedrazas <ipedrazas@gmail.com>
ENV LC_ALL C.UTF-8

RUN apk add --no-cache \
      python \
      python-dev \
      py-pip \
      git \
      g++ && \
      pip install cookiecutter && \
      apk del g++ py-pip  python-dev && \
      adduser -Dg '' cookiecutter && \
      mkdir -p /.cookiecutter_replay/ && \
      chown cookiecutter:cookiecutter -R /.cookiecutter_replay/

USER cookiecutter
WORKDIR "/srv/app"
ENTRYPOINT [ "cookiecutter" ]
