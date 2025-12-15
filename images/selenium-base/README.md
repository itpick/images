# selenium-base

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#selenium-base

# Load into Docker
nix build .#load-selenium-base-to-docker && ./result/bin/load-selenium-base-to-docker
```
