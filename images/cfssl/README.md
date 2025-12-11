# cfssl

CFSSL is Cloudflare's PKI and TLS toolkit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cfssl

# Load into Docker
nix build .#load-cfssl-to-docker && ./result/bin/load-cfssl-to-docker
```
