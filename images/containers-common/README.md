# containers-common

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containers-common

# Load into Docker
nix build .#load-containers-common-to-docker && ./result/bin/load-containers-common-to-docker
```
