FROM centos:centos6

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

# Symlinks is needed by zendframeworks
# I have to reinstall glibc because of a problem with iconv
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
    yum -y reinstall glibc \
    && \
    yum clean all ;\
    useradd makerpm -G mock 

ADD run.sh /run.sh
RUN chmod u+x /run.sh

#ENTRYPOINT ["/run.sh"]
