# external-dns

Minimal image to configure external DNS servers (AWS Route53, Google CloudDNS and others) for Kubernetes Ingresses and Services

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 47s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 326.91 MB |
| Uncompressed | ~817.28 MB |

## Usage

```bash
# Build the image
nix build .#external-dns

# Load into Docker
nix build .#load-external-dns-to-docker && ./result/bin/load-external-dns-to-docker
```
