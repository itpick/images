# k3s-openssl-static

Minimal image with K3s and our FIPS OpenSSL provider

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k3s-openssl-static

# Load into Docker
nix build .#load-k3s-openssl-static-to-docker && ./result/bin/load-k3s-openssl-static-to-docker
```
