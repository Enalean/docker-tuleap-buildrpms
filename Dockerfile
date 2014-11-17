FROM centos:centos6

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

ADD run.sh /run.sh

# Symlinks is needed by zendframeworks
RUN yum install -y \
    rpm-build \
    tar \
    zip \
    make \
    libxslt \
    symlinks \
    && yum clean all \
    ; chmod u+x /run.sh

ENTRYPOINT ["/run.sh"]
