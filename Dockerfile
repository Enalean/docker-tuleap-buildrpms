FROM cbayle/centos6

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

ADD run.sh /run.sh

RUN yum install -y \
    rpm-build \
    tar \
    zip \
    make \
    libxslt \
    && yum clean all \
    ; chmod u+x /run.sh

ENTRYPOINT ["/run.sh"]
