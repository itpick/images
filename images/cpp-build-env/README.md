# C++ Build Environment

A comprehensive C++ development and build environment container with GCC, CMake, and essential libraries.

## Description

This image provides a complete C++ development environment with modern build tools, libraries, and utilities. Includes GCC compiler, CMake, OpenSSL, Google Test, and other essential development tools. Built with a non-root user setup (UID 1000) for secure development workflows.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/cpp-build-env:latest

# Run interactively with workspace mounted
docker run -it -v $(pwd):/workspace ghcr.io/nix-containers/images/cpp-build-env:latest

# Build a C++ project
docker run --rm -v $(pwd):/workspace ghcr.io/nix-containers/images/cpp-build-env:latest cmake . && make
```

### Build Locally with Nix

```bash
# Build the image
nix build .#cpp-build-env

# Load to Docker
nix run .#cpp-build-env.copyTo -- docker-daemon:cpp-build-env:latest

# Run tests
nix run .#cpp-build-env-test
```

## What's Included

- **Compiler**: GCC with C++17/20 support
- **Build Tools**: CMake, GNU Make
- **Libraries**: OpenSSL (runtime + dev), Google Test
- **Utilities**: pkg-config, bash, coreutils, findutils
- **Environment**: Pre-configured CMake and GTest variables
- **User**: Non-root user environment (UID 1000)
- **Working Directory**: /workspace

## Environment Variables

- `OPENSSL_ROOT_DIR`, `OPENSSL_INCLUDE_DIR`, `OPENSSL_CRYPTO_LIBRARY`, `OPENSSL_SSL_LIBRARY`
- `GTEST_ROOT`, `GTEST_INCLUDE_DIR`, `GTEST_LIBRARY`, `GTEST_MAIN_LIBRARY`
- `PKG_CONFIG_PATH` - Pre-configured for included libraries

## Upstream

- **GCC**: https://gcc.gnu.org/
- **CMake**: https://cmake.org/
- **OpenSSL**: https://www.openssl.org/
- **Google Test**: https://github.com/google/googletest