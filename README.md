# docker-cookiecutter

Cookiecutter in a Docker container.

Docker Hub repo: https://hub.docker.com/r/cookiecutter/cookiecutter/

# Usage

In the directory that you want to create your project in:
```
docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv/app:Z cookiecutter/cookiecutter:1.5.1 gh:pydanny/cookiecutter-django
```

With `~/.cookiecutterrc`, `~/.cookiecutters` and `~/.cookiecutter_replay`:
```
touch ~/.cookiecutterrc && mkdir -p ~/.cookiecutters ~/.cookiecutter_replay  # create these first if they don't already exist or they'll be owned by root
docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv/app:Z -v ${HOME}/.cookiecutter_replay:/home/cookiecutter/.cookiecutter_replay:Z -v ${HOME}/.cookiecutters:/home/cookiecutter/.cookiecutters:Z -v ${HOME}/.cookiecutterrc:/home/cookiecutter/.cookiecutterrc:Z cookiecutter/cookiecutter:1.5.1 gh:pydanny/cookiecutter-django
```

If you want to clone from a private repository, you can pass in your SSH keys:
```
docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv/app:Z -v ${HOME}/.ssh:/home/cookiecutter/.ssh:Z cookiecutter/cookiecutter:1.5.1 git@github.com:myorganisation/my-private-repo.git
```

To alias these long commands to just `cookiecutter gh:pydanny/cookiecutter-django`, drop this in to your `~/.bashrc` and then reload it with `source ~/.bashrc`:
```
alias cookiecutter='docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv/app:Z -v ${HOME}/.cookiecutter_replay:/home/cookiecutter/.cookiecutter_replay:Z -v ${HOME}/.cookiecutters:/home/cookiecutter/.cookiecutters:Z -v ${HOME}/.cookiecutterrc:/home/cookiecutter/.cookiecutterrc:Z -v ${HOME}/.ssh:/home/cookiecutter/.ssh:Z cookiecutter/cookiecutter:1.5.1'
```

# Contributing

To set it up for local development:

```
git clone https://github.com/audreyr/docker-cookiecutter.git
cd docker-cookiecutter
make build
make shell
```
