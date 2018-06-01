FROM debian

MAINTAINER Edwin Harmsma <edwin.harmsma@tno.nl>

WORKDIR /root

ENV USER=root
ENV PATH=/root/.cargo/bin/:$PATH

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \ 
        file \
        gcc \
        build-essential \
        musl-tools \
        libc6-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

# TODO: This should be a separate build?
RUN rustup target add x86_64-unknown-linux-musl

CMD cargo

