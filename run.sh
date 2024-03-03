#!/bin/bash

CONTAINER_TYPE=$1

if [ "$CONTAINER_TYPE" = "bashcm" ]; then
    docker run -v /var/run/docker.sock:/var/run/docker.sock -it --rm --name bashcm_exec bashcm
elif [ "$CONTAINER_TYPE" = "pythoncm" ]; then
    docker run -it --rm --name pythoncm_exec pythoncm
else
    echo "Invalid container type"
fi
