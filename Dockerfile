FROM mhart/alpine-node

ENV PATH="/usr/local/bin:${PATH}"

RUN npm install -g reveal-md && \
    npm cache clean --force

RUN apk add --no-cache --update tini curl && \
    rm -Rf /var/cache/apk

RUN sh add-phantomjs.sh

ADD *.md /usr/src/app/

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md -w index.md --port 1948
