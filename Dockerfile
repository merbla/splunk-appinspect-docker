FROM alpine:latest

RUN apk add --no-cache --update \
              musl \
              build-base \
              bash \
              curl \
              make \
              wget \
              git \
              python \
              python-dev \
              py2-pip \
              py-lxml \
              libxml2-dev \
              libpq \
              libxslt-dev \
              libffi-dev \
              gcc

RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN wget --output-document splunk-appinspect.tar.gz http://dev.splunk.com/goto/appinspectdownload && \
    pip install virtualenv --upgrade && \
    pip install awscli && \
    pip install splunk-appinspect.tar.gz && \
    pip install http://download.splunk.com/misc/packaging-toolkit/splunk-packaging-toolkit-1.0.0.tar.gz
