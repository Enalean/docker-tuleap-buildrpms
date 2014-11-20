FROM centos:centos6

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

ADD run.sh /run.sh

# Symlinks is needed by zendframeworks
RUN yum install -y \
    epel-release \
    tar \
    zip \
    make \
    libxslt \
    && \
    yum install -y \
    fedora-packager \
    && \
    yum clean all ;\
    chmod u+x /run.sh ;\
    useradd makerpm -G mock 

#ENTRYPOINT ["/run.sh"]
