FROM mhart/alpine-node

RUN npm install -g reveal-md && \
    npm cache clean

RUN apk add --no-cache --update tini

ADD *.md /usr/src/app/

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md index.md --port 1948
