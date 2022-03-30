#!/bin/bash
docker build . --file Dockerfile --tag fakeapipritunl:v1
docker rm -f FakeApiPritunl
docker run -d --restart unless-stopped --hostname fakeapi -p 9700:80 --name FakeApiPritunl fakeapipritunl:v1
