# Node.js

A container image with Node.js runtime, npm, and yarn package managers.

## Description

This image provides a complete Node.js development environment with the latest LTS Node.js runtime, npm, yarn, and essential build tools. Optimized for both development and production deployment with a non-root user setup (UID 1000).

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/node:latest

# Check Node.js version
docker run --rm ghcr.io/nix-containers/images/node:latest node --version

# Run a Node.js script
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/node:latest node script.js

# Install packages with npm
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/node:latest npm install

# Install packages with yarn
docker run --rm -v $(pwd):/app -w /app ghcr.io/nix-containers/images/node:latest yarn install
```

### Build Locally with Nix

```bash
# Build the image
nix build .#node

# Load to Docker
nix run .#node.copyTo -- docker-daemon:node:latest

# Run tests
nix run .#node-test
```

## What's Included

- Node.js LTS runtime
- npm package manager
- yarn package manager
- Git for dependency management
- GCC and build tools for native modules
- Core utilities and shell
- Non-root user environment (UID 1000)

## Upstream

- **Node.js**: https://nodejs.org/
- **npm**: https://www.npmjs.com/
- **Yarn**: https://yarnpkg.com/