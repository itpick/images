# rekor-cli

Rekor is one of the core components of the sigstore stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#rekor-cli

# Load into Docker
nix build .#load-rekor-cli-to-docker && ./result/bin/load-rekor-cli-to-docker
```
