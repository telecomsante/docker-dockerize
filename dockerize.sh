#!/bin/bash

if [ ! -S /var/run/docker.sock ]; then
	echo 'ERROR: No docker socket mounted (/var/run/docker.sock)';
fi

if [ -d /build -a -x /build/build.sh ]; then
	exec /build/build.sh "$@";
	exit;
else
	echo Build artifacts and build script need to be added to /build
	echo Build script should be /build/build.sh
fi

exit 1;

