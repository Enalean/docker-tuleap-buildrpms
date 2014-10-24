FROM centos:centos6

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

RUN yum install -y rpm-build \
    tar &&\
    yum clean all

RUN yum install -y zip
RUN yum install -y make
RUN yum install -y libxslt

ADD run.sh /run.sh
RUN chmod u+x /run.sh

ENTRYPOINT ["/run.sh"]
