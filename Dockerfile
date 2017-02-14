FROM alpine
LABEL maintainer "clement.desiles@telecomsante.com"

# in this image we ship the `dockerize` tool of larsks/dockerize
ENV DOCKERIZE_VERSION="0.2.2"
ENV DEPS="python rsync py-setuptools docker"
ENV DEV_DEPS="build-base python-dev curl"

RUN apk add ${DEV_DEPS} ${DEPS} -U --no-cache \
    && curl -sSLO https://github.com/larsks/dockerize/archive/$DOCKERIZE_VERSION.tar.gz \
    && tar -C /tmp -xzvf $DOCKERIZE_VERSION.tar.gz \
    && rm -f $DOCKERIZE_VERSION.tar.gz \
    && cd /tmp/dockerize-$DOCKERIZE_VERSION \
    && python setup.py install \
    && rm -rf /tmp/dockerize-$DOCKERIZE_VERSION \
    && apk del ${DEV_DEPS}

ENTRYPOINT ["/usr/bin/dockerize"]
