# selenium-node-docker

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#selenium-node-docker

# Load into Docker
nix build .#load-selenium-node-docker-to-docker && ./result/bin/load-selenium-node-docker-to-docker
```
