# Cosign

Container signing tool with support for OCI registries

## Description

Cosign is a tool for signing and verifying container images and other artifacts using Sigstore. This container image provides a complete Cosign installation with enhanced security features including non-root execution and minimal attack surface. Cosign supports keyless signing with OIDC identity providers, traditional key-based signing, and integrates seamlessly with OCI registries. It's an essential tool for securing container supply chains and implementing software bill of materials (SBOM) workflows.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/cosign:latest

# Sign a container image (keyless)
docker run -it --rm \
  -v ~/.docker/config.json:/home/nonroot/.docker/config.json:ro \
  ghcr.io/nix-containers/images/cosign:latest \
  cosign sign --yes your-registry.com/image:tag

# Verify a signed image
docker run --rm \
  ghcr.io/nix-containers/images/cosign:latest \
  cosign verify --certificate-identity=user@example.com \
  --certificate-oidc-issuer=https://github.com/login/oauth \
  your-registry.com/image:tag

# Generate a key pair for traditional signing
docker run -it --rm \
  -v /host/keys:/home/nonroot/keys \
  ghcr.io/nix-containers/images/cosign:latest \
  cosign generate-key-pair --output-key-prefix /home/nonroot/keys/cosign
```

### Build Locally with Nix

```bash
# Build the image
nix build .#cosign

# Load to Docker
nix run .#cosign.copyTo -- docker-daemon:cosign:latest

# Run tests
nix run .#cosign-test
```

## What's Included

- Cosign container signing and verification tool
- Support for keyless and traditional key-based signing
- OCI registry integration
- SBOM (Software Bill of Materials) support
- Essential system utilities (bash, coreutils, findutils, which)
- Non-root user execution for enhanced security

## Upstream

- https://sigstore.dev/
- https://github.com/sigstore/cosign