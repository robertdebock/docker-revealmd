FROM fedora:32

LABEL maintainer="Robert de Bock <robert@meinit.nl>"
LABEL date=5-jun-2020
LABEL version=1.4

ENV TINI_VERSION v0.19.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN dnf install -y npm && \
    dnf clean all && \
    npm install -g reveal-md puppeteer --unsafe-perm=true && \
    npm cache clean --force && \
    chmod +x /tini

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/tini", "-g", "--"]

CMD reveal-md

HEALTHCHECK CMD printf "GET / HTTP/1.1\n\n" > /dev/tcp/127.0.0.1/1948
