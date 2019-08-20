FROM debian:stretch-slim

RUN set -ex; \
    apt-get update \
    && apt-get -y --no-install-recommends install \
        postal=0.75 \
    ; \
    rm -rf /var/lib/apt/lists/*

ENV RECIPIENT blackhole@example.com
ENV SENDER test@example.com

RUN mkdir /postal \
    && mkdir /postal/logs \
    && echo "$SENDER" > /postal/senders \
    && echo "$RECIPIENT" > /postal/recipients

WORKDIR /postal

ENTRYPOINT ["/usr/sbin/postal"]