# Rust Build Environment

A comprehensive Rust development and build environment with complete toolchain and system libraries.

## Description

This image provides a complete Rust development environment with the full Rust toolchain, system libraries, and build tools. Includes rustc, cargo, rustfmt, rust-analyzer, clippy, and essential system dependencies for building Rust applications. Built with a non-root user setup (UID 1000) for secure development workflows.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/rust-build-env:latest

# Run interactively with workspace mounted
docker run -it -v $(pwd):/workspace ghcr.io/nix-containers/images/rust-build-env:latest

# Build a Rust project
docker run --rm -v $(pwd):/workspace ghcr.io/nix-containers/images/rust-build-env:latest cargo build
```

### Build Locally with Nix

```bash
# Build the image
nix build .#rust-build-env

# Load to Docker
nix run .#rust-build-env.copyTo -- docker-daemon:rust-build-env:latest

# Run tests
nix run .#rust-build-env-test
```

## What's Included

- **Rust Toolchain**: rustc, cargo, rustfmt, rust-analyzer, clippy
- **System Tools**: GCC, binutils (linker), glibc development headers
- **Libraries**: OpenSSL (runtime + dev), pkg-config
- **Utilities**: bash, coreutils, findutils, which, file
- **User**: Non-root user environment (UID 1000)
- **Working Directory**: /workspace

## Environment Variables

Pre-configured environment for seamless Rust development:
- `CARGO_HOME`, `CARGO_HTTP_CAINFO` - Cargo configuration
- `CC`, `CXX`, `LD`, `AR`, `STRIP` - C/C++ toolchain
- `OPENSSL_DIR`, `OPENSSL_LIB_DIR`, `OPENSSL_INCLUDE_DIR` - OpenSSL for crypto crates
- `PKG_CONFIG_PATH`, `LIBRARY_PATH`, `LD_LIBRARY_PATH` - System libraries

## Use Cases

- Rust application development and building
- CI/CD pipelines for Rust projects
- Cross-compilation setup
- Development of system-level Rust applications
- Building Rust applications with native dependencies

## Upstream

- **Rust**: https://www.rust-lang.org/
- **Cargo**: https://doc.rust-lang.org/cargo/
- **rust-analyzer**: https://rust-analyzer.github.io/
- **The Rust Book**: https://doc.rust-lang.org/book/