Dockerised [dockerize](https://github.com/larsks/dockerize/)
============================================================

Dockerize helps build lean images of compiled applications. It also has a built-in `docker` binary.

This docker image provides the dockerize script to build other images. You can find it on the [docker hub](https://hub.docker.com/r/telecomsante/dockerize/):

```sh
docker pull telecomsante/dockerize
```

The image size is ~ *143MB*.

Build
-----

To build the dockerize image:

```sh
git clone https://github.com/telecomsante/docker-dockerize.git
cd docker-dockerize
docker build -t dockerize .
```

Usage
-----

To use the generated image:

```sh
docker run -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/ls:/tmp \
  dockerize -t docker-ls /ls
```

Your new little image containing only ls is now ready:

```sh
$ docker images | head -n 2
REPOSITORY                                                      TAG                 IMAGE ID            CREATED              SIZE
docker-ls                                                       latest              eca8fd618623        7 seconds ago        760 B
```

Pro-tip
-------
Use a bash function alias to help you play with the tool (to add in your `.bashrc`):

```sh
dockerize() {
   length="$(($#-1))"
   first="${@:1:$length}"
   last="/tmp${@: -1}"
   docker run -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${last}:${last} \
    dockerize ${first} ${last}
}
```

> We automatically mount your executable file in the `/tmp/<path-to-stuff>` folder, to not override eventual container internal tools...

Usage is now transparent:

```sh
dockerize -t docker-ls /bin/ls
```

> Keep in mind we do expect absolute paths here.

Credits
-------

This work is inspired of the original idea of [redmatter/docker-dockerize](https://github.com/redmatter/docker-dockerize). It has been lighten up with an alpine image.

The original MIT licence is kept (see [LICENCE](/LICENCE))