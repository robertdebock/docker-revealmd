FROM mhart/alpine-node

ENV PATH="/usr/local/bin:${PATH}"

RUN npm install -g reveal-md && \
    npm cache clean --force

RUN apk add --no-cache --update tini curl && \
    rm -Rf /var/cache/apk

RUN curl -Ls https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz | \
    tar xz -C /

ADD *.md /usr/src/app/

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md -w index.md --port 1948
