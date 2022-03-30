#!/bin/bash
docker build . --file Dockerfile --tag fakeapipritunl:v1
docker run fakeapipritunl:v1 -p9700:80 up -d
