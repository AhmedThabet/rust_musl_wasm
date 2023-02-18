#!/usr/bin/env nu

def main [] {
    docker build -t rust_musl_wasm .
    docker image tag rust_musl_wasm ahmedthabet/rust_musl_wasm:latest
    docker push ahmedthabet/rust_musl_wasm:latest
    docker pushrm -f README.md docker.io/ahmedthabet/rust_musl_wasm
}