# docker-cookiecutter

Cookiecutter in a Docker container.

Docker Hub repo: https://hub.docker.com/r/cookiecutter/cookiecutter/

# Usage

In the directory that you want to create your project in:
```
docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv/app:Z cookiecutter/cookiecutter:1.5.1 gh:pydanny/cookiecutter-django
```

If you want to clone from a private repository, you can pass in your SSH keys:
```
docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv/app:Z -v ${HOME}/.ssh:/home/cookiecutter/.ssh:Z cookiecutter/cookiecutter:1.5.1 gh:pydanny/cookiecutter-django
```

To alias the above command to just `cookiecutter`, drop this in to your `~/.bashrc`:
```
alias cookiecutter='docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv/app:Z -v ${HOME}/.ssh:/home/cookiecutter/.ssh:Z cookiecutter/cookiecutter:1.5.1'
```

# Contributing

To set it up for local development:

```
git clone https://github.com/audreyr/docker-cookiecutter.git
cd docker-cookiecutter
make build
make shell
```
