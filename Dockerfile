FROM rust:1

SHELL ["/bin/bash", "-c"]

RUN DEBIAN_FRONTEND=nointeractive apt -o Acquire::Check-Valid-Until=false update \
    && apt install -f -y --no-install-recommends gcc-9-locales gcc-multilib libtool flex bison gcc-9-multilib musl-dev musl-tools libssl-dev \
    libssl-dev dos2unix\ 
    git ssh curl ca-certificates \
    tcpdump iproute2 \
    && apt clean -y

RUN rustup update \
    && rustup target add x86_64-unknown-linux-musl wasm32-unknown-unknown \
    && cargo install -f wasm-bindgen-cli wasm-pack wasm-opt trunk mdbook cargo-cache && cargo cache -a

ENTRYPOINT ["bash"]
