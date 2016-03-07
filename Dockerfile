#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM alpine:3.3
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

ENV VERSION="1.18.906.35"

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN apk --no-cache add --update -t deps go git bzr wget py-pip \
    gcc python-dev musl-dev linux-headers libffi-dev openssl-dev \
    && apk --no-cache add --update py-setuptools \
    && export GOPATH=/go && go get github.com/pritunl/pritunl-dns \
    && go get github.com/pritunl/pritunl-monitor \
    && wget --no-check-certificate https://github.com/pritunl/pritunl/archive/${VERSION}.tar.gz \
    && tar zxvf ${VERSION}.tar.gz && cd pritunl-${VERSION} \
    && python2 setup.py build && pip install --upgrade pip \
    && pip install -r requirements.txt && mkdir -p /var/lib/pritunl \
    && python2 setup.py install
    #&& apk del --purge deps; rm -rf /tmp/* /var/cache/apk/*

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------

EXPOSE 9700
ENTRYPOINT ["/init"]
