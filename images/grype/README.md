# Grype

Vulnerability scanner for container images and filesystems

## Description

Grype is a vulnerability scanner for container images and filesystems. This container image provides a complete Grype installation with enhanced security features including non-root execution and minimal attack surface. Grype scans for vulnerabilities in application dependencies and operating system packages, supporting multiple programming languages and package managers. It integrates well with CI/CD pipelines and provides detailed vulnerability reports with severity levels and remediation guidance.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/grype:latest

# Scan a container image
docker run --rm ghcr.io/nix-containers/images/grype:latest \
  grype ubuntu:latest

# Scan a local directory
docker run --rm \
  -v /host/project:/home/nonroot/project \
  ghcr.io/nix-containers/images/grype:latest \
  grype dir:/home/nonroot/project

# Generate JSON report
docker run --rm ghcr.io/nix-containers/images/grype:latest \
  grype -o json ubuntu:latest
```

### Build Locally with Nix

```bash
# Build the image
nix build .#grype

# Load to Docker
nix run .#grype.copyTo -- docker-daemon:grype:latest

# Run tests
nix run .#grype-test
```

## What's Included

- Grype vulnerability scanner
- Support for container images, directories, and archives
- Multiple output formats (table, JSON, template)
- Comprehensive vulnerability database
- Essential system utilities (bash, coreutils, findutils, which)
- Non-root user execution for enhanced security

## Upstream

- https://anchore.com/opensource/
- https://github.com/anchore/grype