# selenium-standalone-docker

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#selenium-standalone-docker

# Load into Docker
nix build .#load-selenium-standalone-docker-to-docker && ./result/bin/load-selenium-standalone-docker-to-docker
```
