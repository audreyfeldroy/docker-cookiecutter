COOKIECUTTER_VERSION = 1.5.1
IMAGE_NAME ?= cookiecutter/cookiecutter:$(COOKIECUTTER_VERSION)
TAG = $(SERVERLESS_VERSION)

build:
	docker build -t $(IMAGE_NAME) .

pull:
	docker pull $(IMAGE_NAME)

shell:
	docker run --rm -it --user $(id -u):$(id -g) -v $(PWD):/srv/app:Z --entrypoint=sh $(IMAGE_NAME)

tag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
