FROM fedora:39

LABEL maintainer="Robert de Bock <robert@meinit.nl>"
LABEL date=08-jan-2024
LABEL version=1.6
LABEL build_date="2024-01-08"

RUN dnf install -y npm && \
    dnf clean all && \
    npm install -g reveal-md puppeteer --unsafe-perm=true && \
    npm cache clean --force

EXPOSE 1948

WORKDIR /usr/src/app

ENTRYPOINT ["reveal-md"]

HEALTHCHECK CMD printf "GET / HTTP/1.1\n\n" > /dev/tcp/127.0.0.1/1948
