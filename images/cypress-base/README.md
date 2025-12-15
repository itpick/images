# cypress-base

Minimal image for cypress/base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cypress-base

# Load into Docker
nix build .#load-cypress-base-to-docker && ./result/bin/load-cypress-base-to-docker
```
