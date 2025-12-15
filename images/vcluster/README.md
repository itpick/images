# vcluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vcluster

# Load into Docker
nix build .#load-vcluster-to-docker && ./result/bin/load-vcluster-to-docker
```
