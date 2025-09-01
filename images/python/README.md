# Python

A container image with Python 3.12 runtime and development tools.

## Description

This image provides a complete Python development environment with Python 3.12, pip, and essential build tools. Designed for both development and production use with a non-root user setup (UID 1000).

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/python:latest

# Run Python interactively
docker run -it ghcr.io/nix-containers/images/python:latest python

# Run a Python script
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/python:latest python script.py

# Install packages and run
docker run --rm ghcr.io/nix-containers/images/python:latest pip install requests && python -c "import requests; print('OK')"
```

### Build Locally with Nix

```bash
# Build the image
nix build .#python

# Load to Docker
nix run .#python.copyTo -- docker-daemon:python:latest

# Run tests
nix run .#python-test
```

## What's Included

- Python 3.12 interpreter
- pip package manager
- setuptools and wheel
- GCC and build tools for native extensions
- Git, bash, and core utilities
- Non-root user environment (UID 1000)

## Upstream

- **Python**: https://www.python.org/
- **pip**: https://pip.pypa.io/