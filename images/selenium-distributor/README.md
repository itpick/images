# selenium-distributor

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#selenium-distributor

# Load into Docker
nix build .#load-selenium-distributor-to-docker && ./result/bin/load-selenium-distributor-to-docker
```
