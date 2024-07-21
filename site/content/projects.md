---
title: Projects
---

![chilly logo](/chilly.png)

Welcome to `chilly.griffinht.com`

I would like to host public developer focused services from this website. This site will not include sensitive/non public data. This includes
- Docker Container Registry
- S3 Bucket
- File sync server idk
- Static site host
- Git host
- Workflow Orchestration/CI
    - but no secrets!?!?
- Photo viewer
- Plausible analytics
- metrics/montiroing????? security!
- Form creator?
- Uptime page/checker/thing?
- Game servers?

## [iPerf](https://iperf.fr/)

iPerf is a speed test tool for measuring network speed. I host an instance at `iperf.chilly.griffinht.com`.

Try connecting to it with the iPerf client:

```sh
iperf3 -c iperf.chilly.griffinht.com
```

```sh
docker run --rm -it docker.io/griffinhtdocker/iperf iperf3 -c iperf.chilly.griffinht.com
```

## [Redlib](https://github.com/redlib-org/redlib)

Redlib is a private front-end to Reddit. I host an instance at [redlib.chilly.griffinht.com](https://redlib.chilly.griffinht.com)

## [SearXNG](https://github.com/searxng/searxng)

SearXNG is an internet metasearch engine. It from duckduckgo, brave, google, qwant, and more. I host an instance at [searxng.chilly.griffinht.com](https://searxng.chilly.griffinht.com)
