# curl

Minimal curl image base containing curl and ca-certificates

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#curl

# Load into Docker
nix build .#load-curl-to-docker && ./result/bin/load-curl-to-docker
```
