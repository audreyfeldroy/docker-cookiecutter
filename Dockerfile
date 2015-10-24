FROM python:3.5
MAINTAINER Audrey Roy Greenfeld (GitHub @audreyr / Docker @aroygreenfeld)

# Install Cookiecutter
RUN pip install --no-cache-dir cookiecutter

ENTRYPOINT ["cookiecutter"]
