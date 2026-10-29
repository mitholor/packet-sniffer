FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential gdb valgrind man-db manpages-dev \
        tcpdump iputils-ping curl dnsutils netcat-openbsd iproute2 \
        vim less \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
CMD [ "bash" ]
