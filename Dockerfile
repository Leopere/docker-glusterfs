FROM centos:7
MAINTAINER Patrice FERLET <metal3d@gmail.com>

RUN set -xe \
    yum install -y centos-release-gluster7.noarch && \
    yum install -y glusterfs-server && \
    yum clean all && \
    touch /var/lib/glusterd/secure-access
COPY ./start.sh /entrypoint.sh /usr/bin/

CMD ["start.sh"]
