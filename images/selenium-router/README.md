# selenium-router

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#selenium-router

# Load into Docker
nix build .#load-selenium-router-to-docker && ./result/bin/load-selenium-router-to-docker
```
