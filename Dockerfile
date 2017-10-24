FROM mhart/alpine-node

RUN npm install -g reveal-md && \
    npm install -g phantomjs-prebuilt && \
    npm cache clean --force && \
    apk add --no-cache --update tini && \
    rm -Rf /var/cache/apk

ADD *.md /usr/src/app/

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md -w index.md --port 1948
