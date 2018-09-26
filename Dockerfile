FROM fedora:28

LABEL date=26-sep-2018
LABEL version=1.2

ENV TINI_VERSION v0.18.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN dnf install -y npm && \
    dnf clean all && \
    npm install -g reveal-md && \
    npm cache clean --force && \
    chmod +x /tini

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["/tini", "-g", "--"]

CMD reveal-md

HEALTHCHECK CMD printf "GET / HTTP/1.1\n\n" > /dev/tcp/127.0.0.1/1948
