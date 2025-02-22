FROM python:3.10-bullseye as builder

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    ca-certificates \
    libcurl4-gnutls-dev \
    libgnutls28-dev \
    git \
    nodejs \
    npm

WORKDIR /srv/nbviewer

COPY . /srv/nbviewer

RUN python3 -mpip install -r requirements-dev.txt -r requirements.txt
RUN python3 setup.py build && \
    python3 -mpip wheel -vv . -w /wheels

FROM python:3.10-slim-bullseye
LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    ca-certificates \
    libcurl4 \
    git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=builder /wheels /wheels
RUN python3 -mpip install --no-cache /wheels/*

ENV NBVIEWER_THREADS 2
WORKDIR /srv/nbviewer
USER nobody

EXPOSE 5000
CMD ["python", "-m", "nbviewer"]