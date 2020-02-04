FROM centos:7
MAINTAINER Patrice FERLET <metal3d@gmail.com>

ENV GLUSTER_VERSION 3.8

RUN set -xe; \
    yum install -y centos-release-gluster${GLUSTER_VERSION/./}.noarch; \
    yum install -y glusterfs-server; \
    yum clean all; && \
    touch /var/lib/glusterd/secure-access
COPY ./start.sh /entrypoint.sh /usr/bin/

CMD ["start.sh"]
