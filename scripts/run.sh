#!/bin/bash
set -ex

docker run -it -p 80:80 --rm stevemcquaid/python-flask-docker-hello-world:latest
