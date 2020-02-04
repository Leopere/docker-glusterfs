FROM centos:7
MAINTAINER Patrice FERLET <metal3d@gmail.com>

RUN yum install -y centos-release-gluster glusterfs-server && \
    yum clean all && \
    mkdir -p /var/lib/glusterd/ && touch /var/lib/glusterd/secure-access
COPY ./start.sh /entrypoint.sh /usr/bin/

CMD ["start.sh"]
