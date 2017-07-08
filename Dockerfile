FROM mhart/alpine-node

RUN npm install -g reveal-md && \
    npm cache clean --force

RUN apk add --no-cache --update tini && \
    rm -Rf /var/cache/apk

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md index.md --port "${port:-1948}" --host "${host:-localhost}"
