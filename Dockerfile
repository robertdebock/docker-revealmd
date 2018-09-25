FROM mhart/alpine-node

LABEL date=25-sep-2018
LABEL version=1.1

RUN npm install -g reveal-md && \
    npm cache clean --force && \
    apk add --no-cache --update tini && \
    rm -Rf /var/cache/apk && \
    ln -s /node_modules/phantomjs-prebuilt/bin/phantomjs /bin

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md
