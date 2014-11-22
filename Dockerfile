FROM centos:centos6

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

# symlinks is for zendframeworks
# gcc for missing build dep in mailman-tuleap
# glibc reinstalled because of a problem with iconv/locales in openfire
# ant added for faster openfire build
RUN yum install -y \
    epel-release \
    tar \
    zip \
    make \
    libxslt \
    symlinks \
    gcc \
    ant \
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
