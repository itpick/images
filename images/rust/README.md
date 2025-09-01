# Rust

A container image with Rust programming language and development tools.

## Description

This image provides Rust compiler, Cargo package manager, and essential development tools. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for developing, building, and testing Rust applications in CI/CD pipelines or development environments.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/rust:latest

# Check Rust version
docker run --rm ghcr.io/nix-containers/images/rust:latest rustc --version

# Create and run a new Rust project
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/rust:latest cargo new hello_world
docker run --rm -v $(pwd):/workspace -w /workspace/hello_world ghcr.io/nix-containers/images/rust:latest cargo run

# Build a Rust project
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/rust:latest cargo build --release
```

### Build Locally with Nix

```bash
# Build the image
nix build .#rust

# Load to Docker
nix run .#rust.copyTo -- docker-daemon:rust:latest

# Run tests
nix run .#rust-test
```

## What's Included

- Rust compiler (rustc) - systems programming language
- Cargo - Rust package manager and build tool
- rustfmt - code formatter
- Clippy - linter and code analysis tool
- rust-analyzer - language server
- Git for version control
- Build tools (GCC, make, pkg-config)
- OpenSSL for cryptographic operations
- Non-root user environment (UID 1000)
- Pre-configured CARGO_HOME and RUSTUP_HOME

## Upstream

- **Rust**: https://www.rust-lang.org/