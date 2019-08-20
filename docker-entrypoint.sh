#!/usr/bin/env bash


if [[ -n "${RECIPIENT}" ]]; then
    echo "$RECIPIENT" > /postal/recipient
else
    echo "Please set RECIPIENT environment" && \
    exit 1
fi

if [[ -n "${SENDER}" ]];then
    echo "$SENDER" > /postal/sender
else
    echo "Please set SENDER environment" && \
    exit 1
fi

if [[ -z "${SERVER}" ]];then
    echo "Please set SERVER environment" && \
    exit 1
fi

exec /usr/sbin/postal "$@" -f /postal/sender "${SERVER}" /postal/recipient