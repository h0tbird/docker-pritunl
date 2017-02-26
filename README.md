# pritunl

[![Build Status](https://travis-ci.org/katosys/pritunl.svg?branch=master)](https://travis-ci.org/katosys/pritunl)

Containerized Pritunl service.

##### 1. Mongodb:

```
docker run -it --rm \
--name mongo \
--net host \
mongo:3.4 \
--bind_ip 127.0.0.1
```

##### 2. Pritunl:

```
docker run -it --rm \
--privileged \
--name pritunl \
--net host \
--env MONGODB_URI=mongodb://127.0.0.1:27017/pritunl \
quay.io/kato/pritunl:latest
```

##### 3. Browse to:

https://127.0.0.1

##### Systemd unit:

```
[Unit]
Description=Pritunl
After=mongodb.service
Requires=mongodb.service

[Service]
Slice=kato.slice
Restart=always
RestartSec=10
TimeoutStartSec=0
KillMode=mixed
LimitNOFILE=25000
Environment=IMG=quay.io/kato/pritunl:latest
ExecStartPre=/usr/bin/rkt fetch ${IMG}
ExecStart=/usr/bin/rkt run --stage1-from-dir=stage1-fly.aci \
 --net=host \
 --dns=host \
 --hosts-entry=host \
 --set-env MONGODB_URI=mongodb://127.0.0.1:27017/pritunl \
 ${IMG}

[Install]
WantedBy=kato.target
```
