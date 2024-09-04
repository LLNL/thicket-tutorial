#!/bin/bash

set -e

curr_dir=$(pwd)
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
thicket_tutorial_root_dir=$(dirname -- $script_dir)

cd $thicket_tutorial_root_dir

docker build -t thicket-tutorial -f Dockerfile.local .
set +e
docker network ls | grep thicket_jupyterhub &> /dev/null
network_exists=$?
set -e
if test "$network_exists" -ne 0; then
    docker network create thicket_jupyterhub
fi

docker run --rm -it --entrypoint /run_all.sh -v /var/run/docker.sock:/var/run/docker.sock -v $thicket_tutorial_root_dir:/home/jovyan --net thicket_jupyterhub --name thicket_jupyterhub -p 8888:8888 thicket-tutorial notebooks/*

docker network prune -f

cd $curr_dir
