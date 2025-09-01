# Static

A minimal container image with statically linked binaries for maximum portability.

## Description

This image provides statically linked versions of essential Unix utilities, ensuring maximum portability across different systems without external dependencies. Built on a non-root user setup (UID 1000) for enhanced security. Perfect as a minimal base image for applications that need self-contained binaries.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/static:latest

# Run interactive shell
docker run -it ghcr.io/nix-containers/images/static:latest

# Use basic utilities
docker run --rm ghcr.io/nix-containers/images/static:latest ls -la

# Check if binaries are statically linked
docker run --rm ghcr.io/nix-containers/images/static:latest ldd /bin/bash || echo "Statically linked"
```

### Build Locally with Nix

```bash
# Build the image
nix build .#static

# Load to Docker
nix run .#static.copyTo -- docker-daemon:static:latest

# Run tests
nix run .#static-test
```

## What's Included

- Statically linked bash shell
- Statically linked core utilities (ls, cp, mv, etc.)
- Statically linked file utilities (find, which)
- Non-root user environment (UID 1000)
- No external library dependencies

## Upstream

- **GNU Coreutils**: https://www.gnu.org/software/coreutils/
- **Bash**: https://www.gnu.org/software/bash/