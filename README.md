# Dockerised [dockerize](https://github.com/larsks/dockerize/) script

Dockerize helps build lean images of compiled applications. It also has a built in `docker` binary.

This image provides dockerize script and can be used to build other images.

If you put shell script in `/build/build.sh` it will be executed to perform the build. Within the script, you can invoke `dockerize` to build an image. Optionally, you may invoke `dockerize` to just generate the files and then invoke `docker build` to perform the build.

## Example

See [docker-rsyslog](https://github.com/redmatter/docker-rsyslog) for a working example.
