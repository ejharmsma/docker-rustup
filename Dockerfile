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

# Important: use commands like below to install the desired targets and/or toolchains:

# MUSL stable (static compiled standalone binaries):
# RUN rustup target add x86_64-unknown-linux-musl

# MUSL nightly
# RUN rustup toolchain install nightly && \
#     rustup default nightly && \
#     rustup target add x86_64-unknown-linux-musl

# Or all available tags at https://hub.docker.com/r/ejharmsma/rustup/tags/
# and sources at https://github.com/ejharmsma/docker-rustup

CMD cargo
