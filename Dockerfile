FROM python:2.7

COPY dockerize.sh /

RUN set -x \
		&& mkdir /app && cd /app \

		&& git clone https://github.com/larsks/dockerize.git . \
		&& python setup.py install --optimize=2 \

		&& curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.10.1 \
		&& mv docker-1.10.1 /usr/bin/docker \
		&& chmod +x /usr/bin/docker \

		&& cd / && rm -rf /app

ENTRYPOINT /dockerize.sh

