# bun

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#bun

# Load into Docker
nix build .#load-bun-to-docker && ./result/bin/load-bun-to-docker
```
