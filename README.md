# docker-cookiecutter

Cookiecutter in a Docker container.

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
