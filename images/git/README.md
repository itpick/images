# Git

A container image with Git version control system and essential development tools.

## Description

This image provides Git along with SSH, GPG, and common Unix utilities for version control operations. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for CI/CD pipelines, development environments, or any task requiring Git operations.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/git:latest

# Clone a repository
docker run --rm -v $(pwd):/workspace ghcr.io/nix-containers/images/git:latest git clone https://github.com/example/repo.git /workspace/repo

# Check git status in current directory
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/git:latest git status

# Run interactive shell with git
docker run -it -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/git:latest
```

### Build Locally with Nix

```bash
# Build the image
nix build .#git

# Load to Docker
nix run .#git.copyTo -- docker-daemon:git:latest

# Run tests
nix run .#git-test
```

## What's Included

- Git - distributed version control system
- OpenSSH - for SSH-based Git operations
- GnuPG - for commit signing and verification
- Bash shell and core utilities
- Text processing tools (awk, sed, grep)
- Non-root user environment (UID 1000)
- Pre-configured SSL certificates

## Upstream

- **Git**: https://git-scm.com/
- **OpenSSH**: https://www.openssh.com/
- **GnuPG**: https://gnupg.org/