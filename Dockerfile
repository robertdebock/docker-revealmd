FROM mhart/alpine-node

LABEL date=25-sep-2018
LABEL version=1.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD yes

RUN npm install -g reveal-md && \
    npm install pdf-puppeteer && \
    npm cache clean --force && \
    apk add --no-cache --update tini && \
    rm -Rf /var/cache/apk && \
    ln -s /node_modules/phantomjs-prebuilt/bin/phantomjs /bin

ADD *.md /usr/src/app/

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD reveal-md index.md
