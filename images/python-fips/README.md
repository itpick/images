# Python FIPS

Python 3.13 runtime with FIPS 140-2 ready configuration for security-sensitive environments

## Description

The Python FIPS runtime provides everything needed to run Python applications in environments requiring FIPS 140-2 compliance. This container includes OpenSSL with FIPS configuration available and Python cryptography libraries ready to use FIPS-approved algorithms when enabled. Perfect for government, financial, and healthcare applications that require cryptographic compliance.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/python-fips:latest

# Run Python with FIPS mode
docker run -it --rm ghcr.io/nix-containers/images/python-fips:latest python3

# Run a Python script
docker run -it --rm \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/python-fips:latest \
  python3 app.py

# Install packages with pip (FIPS-compliant)
docker run -it --rm \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/python-fips:latest \
  pip install --user requests
```

### Build Locally with Nix

```bash
# Build the image
nix build .#python-fips

# Load to Docker
nix run .#python-fips.copyTo -- docker-daemon:python-fips:latest

# Run tests
nix run .#python-fips-test
```

## FIPS Compliance

This image is configured for FIPS 140-2 readiness:

- **OpenSSL FIPS Configuration**: FIPS configuration file available at `/etc/fips/openssl.cnf`
- **Environment Variables**: `OPENSSL_FIPS_READY=1` and `FIPS_CONFIG_AVAILABLE` are set
- **Cryptography Libraries**: Python cryptography package ready for FIPS mode
- **Activation**: Users can enable FIPS mode by setting `OPENSSL_CONF` to the provided config

## Verification

Verify FIPS readiness and enable FIPS mode:

```bash
# Check FIPS configuration availability
docker run --rm ghcr.io/nix-containers/images/python-fips:latest \
  ls -la /etc/fips/openssl.cnf

# Enable FIPS mode temporarily
docker run --rm -e OPENSSL_CONF=/etc/fips/openssl.cnf \
  ghcr.io/nix-containers/images/python-fips:latest \
  python3 -c "import ssl; print('SSL context created successfully')"

# Check OpenSSL FIPS capability
docker run --rm ghcr.io/nix-containers/images/python-fips:latest \
  openssl version -v
```

## What's Included

- Python 3.13 with FIPS-ready cryptography
- OpenSSL with FIPS 140-2 module enabled
- pip, setuptools, wheel for package management
- Essential development tools (git, gcc, make)
- Non-root user execution for enhanced security
- FIPS compliance environment variables

## Use Cases

- Government applications requiring FIPS compliance
- Financial services with cryptographic requirements
- Healthcare applications with security standards
- Enterprise applications in regulated industries
- Security-sensitive web services and APIs

## Upstream

- https://www.python.org/
- https://www.openssl.org/docs/fips/