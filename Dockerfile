FROM openresty/openresty

# install common packages
RUN apk add --update-cache curl bash git git-gitweb spawn-fcgi fcgiwrap supervisor util-linux coreutils perl perl-cgi docker \
    && rm -rf /var/cache/apk/*

RUN apk add --update-cache py-pip && pip install docker-compose && apk del py-pip && rm -rf /var/cache/apk/*

COPY rootfs /
RUN chmod -R +x /usr/bin/
COPY hooks /usr/share/git-core/templates/hooks

ENTRYPOINT ["/usr/bin/env"]

RUN addgroup -S git
RUN adduser -D -G git -h /home/git git
RUN chown -R git:git /home/git
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
