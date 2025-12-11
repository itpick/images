# nifi-registry

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#nifi-registry

# Load into Docker
nix build .#load-nifi-registry-to-docker && ./result/bin/load-nifi-registry-to-docker
```
