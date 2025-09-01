# C++ Runtime

A minimal runtime environment for C++ and Rust applications with essential system libraries.

## Description

This image provides a lightweight runtime environment for compiled C++ and Rust applications. Includes glibc, OpenSSL, and C++ standard library runtime components without development tools. Built with a non-root user setup (UID 1000) for secure application deployment.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/cpp-runtime:latest

# Run your application
docker run --rm -v $(pwd):/app ghcr.io/nix-containers/images/cpp-runtime:latest ./my-cpp-app

# Run interactively
docker run -it ghcr.io/nix-containers/images/cpp-runtime:latest
```

### Build Locally with Nix

```bash
# Build the image
nix build .#cpp-runtime

# Load to Docker
nix run .#cpp-runtime.copyTo -- docker-daemon:cpp-runtime:latest

# Run tests
nix run .#cpp-runtime-test
```

## What's Included

- **Runtime Libraries**: glibc, OpenSSL, C++ standard library
- **Shell**: GNU Bash
- **Utilities**: Core utilities (coreutils)
- **User**: Non-root user environment (UID 1000)
- **Working Directory**: /app
- **Library Path**: Pre-configured for included runtime libraries

## Environment Variables

- `LD_LIBRARY_PATH` - Pre-configured for glibc, OpenSSL, and C++ runtime libraries

## Use Cases

- Running compiled C++ applications
- Running Rust applications that link to system libraries
- Minimal runtime environment for statically linked binaries
- Base image for application containers

## Upstream

- **glibc**: https://www.gnu.org/software/libc/
- **OpenSSL**: https://www.openssl.org/
- **GCC**: https://gcc.gnu.org/ (runtime libraries only)