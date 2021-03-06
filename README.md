# docker-revealmd

[![](https://images.microbadger.com/badges/image/robertdebock/docker-revealmd.svg)](https://microbadger.com/images/robertdebock/docker-revealmd "Get your own image badge on microbadger.com")

## The reveal-md container.

The application [reveal-md](https://github.com/webpro/reveal-md) is used to show markdown files in the browser.

## Running the container.

Make your presentation in a file like `index.md` and continue:

```bash
docker run -v $(pwd):/usr/src/app:Z -p 1948:1948 robertdebock/docker-revealmd index.md
```

## Seeing the presentation.

Open your browser and go to: [http://localhost:1948/](http://localhost:1948/) (Or incase Docker is running somewhere else, replace "localhost" by the name of host Docker is running on.)

If you want to present on anything other than "localhost" feed reveal-md the host ip address like so:

```bash
docker run -e host=192.168.1.1 -v $(pwd):/usr/src/app:Z -p 1948:1948 robertdebock/docker-revealmd index.md
```
