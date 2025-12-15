# rekor-server

Rekor is one of the core components of the sigstore stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#rekor-server

# Load into Docker
nix build .#load-rekor-server-to-docker && ./result/bin/load-rekor-server-to-docker
```
