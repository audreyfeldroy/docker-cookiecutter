FROM python:3.5
MAINTAINER Audrey Roy Greenfeld (GitHub @audreyr / Docker @aroygreenfeld)

# Setting LC_ALL and LANG to en_US.UTF-8 to get Click to work
# http://click.pocoo.org/5/python3/
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# Install Cookiecutter
RUN pip install --no-cache-dir cookiecutter

ENTRYPOINT ["cookiecutter"]
