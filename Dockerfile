FROM fedora:31
LABEL maintainer="Leopere github@c.nixc.us"

RUN dnf install glusterfs-server -y && \
    mkdir -p /var/lib/glusterd/ && touch /var/lib/glusterd/secure-access

COPY ./sh/start ./sh/entrypoint /usr/bin/
EXPOSE 24007 24008
EXPOSE 49152 49153 49154 49155 49156 49157 49158

CMD ["start"]
