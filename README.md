# Description

rust_musl_wasm image is used mainly a builder image for rust projects that need to build for wasm and musl targets.\
[Git Repo](https://github.com/AhmedThabet/rust_musl_wasm) \
It's built on top of rust:1 so, it's a debian based image with rust and the following targets installed:

1. wasm32-unknown-unknown
2. x86_64-unknown-linux-gnu
3. x86_64-unknown-linux-musl

The image has tools to build musl and wasm targets:

1. wasm-bindgen
2. wasm-pack
3. wasm-opt
4. trunk
5. mdbook (documenting tool)

## Usage

```bash
docker pull ahmedthabet/rust_musl_wasm
```

```dockerfile
FROM ahmedthabet/rust_musl_wasm:latest as builder

WORKDIR /app
RUN cargo build --release --target wasm32-unknown-unknown
# or 
RUN cargo build --release --target x86_64-unknown-linux-musl

# Then build a minimal image for your executable if needed
FROM --platform=x86_64 scratch
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/myapp /app
CMD ["/app"]
```
