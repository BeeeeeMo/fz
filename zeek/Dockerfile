FROM zeek/zeek:5.2

ENV TINI_VERSION v0.19.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY init.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh 

# CMD ["/docker-entrypoint.sh"]
ENTRYPOINT ["/tini", "--", "/docker-entrypoint.sh"]