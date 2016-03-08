# docker-pritunl

[![Build Status](https://travis-ci.org/h0tbird/docker-pritunl.svg?branch=master)](https://travis-ci.org/h0tbird/docker-pritunl)

Containerized Pritunl service.

##### 1. Mongodb:

```
docker run -it --rm \
--net host --name mongo \
mongo:3.2
```

##### 2. Pritunl:

```
docker run -it --rm \
--net host --name pritunl \
h0tbird/pritunl:latest
```
