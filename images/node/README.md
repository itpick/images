# node

Minimal container image for running NodeJS apps

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#node

# Load into Docker
nix build .#load-node-to-docker && ./result/bin/load-node-to-docker
```
