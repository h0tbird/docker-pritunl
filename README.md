# docker-pritunl

[![Build Status](https://travis-ci.org/katosys/docker-pritunl.svg?branch=master)](https://travis-ci.org/katosys/docker-pritunl)

Containerized Pritunl service.

##### 1. Mongodb:

```
docker run -it --rm \
--net host --name mongo \
mongo:3.4 \
--bind_ip 127.0.0.1
```

##### 2. Pritunl:

```
docker run -it --rm \
--privileged \
--net host --name pritunl \
--env MONGODB_URI=mongodb://127.0.0.1:27017/pritunl \
quay.io/kato/pritunl:latest
```

##### 3. Browse to:

https://127.0.0.1
