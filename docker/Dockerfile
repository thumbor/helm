FROM python:3.10-slim-bullseye

ARG TARGETPLATFORM

RUN mkdir /app
WORKDIR /app

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y autoremove && \
    apt-get install -y -q --no-install-recommends \
        curl \
        libssl-dev \
        libcurl4-openssl-dev \
        libexiv2-dev \
        libjpeg-dev \
        libwebp-dev \
        libjpeg-turbo-progs \
        graphicsmagick \
        libgraphicsmagick++3 \
        libgraphicsmagick++1-dev \
        libgraphicsmagick-q16-3 \
        zlib1g-dev \
        libboost-python-dev \
        gifsicle \
        ffmpeg && \
    apt-get clean
RUN echo ${TARGETPLATFORM} > /tmp/arch
RUN cat /tmp/arch

RUN case ${TARGETPLATFORM} in \
        "linux/amd64")  ARCH="x86_64"  ;; \
        "linux/arm64") ARCH="aarch64"  ;; \
    esac && \
    ln -s /usr/lib/${ARCH}-linux-gnu/libboost_python39.so /usr/lib/libboost_python3.so

COPY requirements.txt .
RUN apt-get update && \
    apt-get install build-essential gcc -y -q --no-install-recommends && \
    pip install -r requirements.txt && \
    pip install thumbor==7.1.1 && \
    apt-get remove gcc build-essential -y -q && \
    apt-get clean
