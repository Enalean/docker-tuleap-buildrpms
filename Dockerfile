FROM centos:centos5

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

RUN yum install -y rpm-build \
    tar \
    util-linux &&\
    yum clean all

RUN yum install -y zip
RUN yum install -y make
RUN yum install -y libxslt

ADD run.sh /run.sh
RUN chmod u+x /run.sh

VOLUME ["/rpms"]

ENTRYPOINT ["/run.sh"]
