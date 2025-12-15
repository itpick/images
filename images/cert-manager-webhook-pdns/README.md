# cert-manager-webhook-pdns

A PowerDNS webhook for cert-manager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-manager-webhook-pdns

# Load into Docker
nix build .#load-cert-manager-webhook-pdns-to-docker && ./result/bin/load-cert-manager-webhook-pdns-to-docker
```
