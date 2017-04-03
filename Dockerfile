FROM mhart/alpine-node

RUN npm install -g reveal-md && \
    npm cache clean

RUN apk add --no-cache --update tini

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md index.md --port "${port:-1948}" --host "${host:-localhost}"
