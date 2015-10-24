# docker-cookiecutter

Cookiecutter in a Docker container.

This almost works. I'm just stuck on figuring this out:

* https://github.com/audreyr/docker-cookiecutter/issues/1

# Usage

```
docker run -e LC_ALL=C.UTF-8 -t cookiecutter gh:pydanny/cookiecutter-django
```

# Contributing

To set it up for local development:

```
git clone https://github.com/audreyr/docker-cookiecutter.git
cd docker-cookiecutter
docker build -t cookiecutter .
docker run -t cookiecutter
```
