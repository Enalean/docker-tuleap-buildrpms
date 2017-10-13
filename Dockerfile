FROM centos:6

RUN yum install -y rpm-build \
    tar \
    util-linux \
    zip \
    libxslt \
    make &&\
    yum clean all

COPY run.sh /run.sh

VOLUME ["/rpms"]

ENTRYPOINT ["/run.sh"]
