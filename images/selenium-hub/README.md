# selenium-hub

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#selenium-hub

# Load into Docker
nix build .#load-selenium-hub-to-docker && ./result/bin/load-selenium-hub-to-docker
```
