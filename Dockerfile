# vim:set ft=dockerfile:
FROM alpine:3.6

MAINTAINER Ivan Tyshchenko <iv.tihon@gmail.com>

RUN apk add --update less curl sngrep ngrep \
      asterisk asterisk-curl asterisk-sounds-en asterisk-sounds-moh asterisk-srtp asterisk-pgsql \
&&  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# start asterisk so it creates missing folders and initializes astdb
RUN asterisk && sleep 5

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/asterisk", "-f", "-T", "-W", "-U", "root", "-p"]


