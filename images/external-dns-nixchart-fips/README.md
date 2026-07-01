# external-dns-nixchart-fips

Minimal image to configure external DNS servers (AWS Route53, Google CloudDNS and others) for Kubernetes Ingresses and Services

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#external-dns-nixchart-fips

# Load into Docker
nix build .#load-external-dns-nixchart-fips-to-docker && ./result/bin/load-external-dns-nixchart-fips-to-docker
```
