FROM debian:stretch-slim

ENV POSTAL_VERSION 0.75

RUN set -ex; \
    apt-get update \
    && apt-get -y --no-install-recommends install \
        postal="${POSTAL_VERSION}" \
    ; \
    rm -rf /var/lib/apt/lists/*


RUN mkdir -p /postal/logs

WORKDIR /postal

COPY wait-for-it.sh /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/sbin/postal"]


