FROM alpine:latest

RUN set -ex \
    && apk add tini --update --no-cache 

ENTRYPOINT ["/sbin/tini", "--"]

CMD cp -r /image /cron && chmod 0644 /cron \
    && crond -b -c /cron && touch /var/log/cron.log && tail -F /var/log/cron.log