FROM debian:bullseye-slim AS builder-image

ARG TARGETPLATFORM
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y autoremove && \
    apt-get install --no-install-recommends -y \
        python3.9 \
        python3.9-dev \
        python3.9-venv \
        python3-pip \
        python3-wheel \
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
        gcc \
        libcairo2-dev \
        build-essential && \
	apt-get clean && rm -rf /var/lib/apt/lists/*


RUN python3.9 -m venv /home/thumbor/venv
ENV PATH="/home/thumbor/venv/bin:$PATH"

RUN case ${TARGETPLATFORM} in \
        "linux/amd64")  ARCH="x86_64"  ;; \
        "linux/arm64") ARCH="aarch64"  ;; \
    esac && \
    ln -s /usr/lib/${ARCH}-linux-gnu/libboost_python39.so /usr/lib/libboost_python3.so

COPY requirements.txt .

RUN pip3 install --no-cache-dir wheel && \
    pip3 install --no-cache-dir -r requirements.txt && \
    pip3 install --no-cache-dir thumbor==7.1.1

FROM debian:bullseye-slim AS runner-image

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        curl \
        gifsicle \
        libcairo2 \
        python3.9 \
        python3-venv && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home thumbor
COPY --from=builder-image /home/thumbor/venv /home/thumbor/venv

USER thumbor

EXPOSE 8888

ENV PYTHONUNBUFFERED=1

ENV VIRTUAL_ENV=/home/thumbor/venv
ENV PATH="/home/thumbor/venv/bin:$PATH"

CMD ["thumbor", "-d", "-l", "debug"]
