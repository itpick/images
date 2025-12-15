# docker-cli

Minimal Docker CLI container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-cli

# Load into Docker
nix build .#load-docker-cli-to-docker && ./result/bin/load-docker-cli-to-docker
```
