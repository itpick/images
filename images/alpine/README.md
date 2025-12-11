# alpine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#alpine

# Load into Docker
nix build .#load-alpine-to-docker && ./result/bin/load-alpine-to-docker
```
