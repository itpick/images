# rancher-loglevel

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-loglevel

# Load into Docker
nix build .#load-rancher-loglevel-to-docker && ./result/bin/load-rancher-loglevel-to-docker
```
