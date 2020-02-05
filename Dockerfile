FROM fedora:31
LABEL maintainer="Leopere github@c.nixc.us"

RUN dnf install glusterfs-server -y && \
    mkdir -p /var/lib/glusterd/ && touch /var/lib/glusterd/secure-access

COPY ./sh/start ./sh/entrypoint /usr/bin/

CMD ["start"]
