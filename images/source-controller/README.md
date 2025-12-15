# source-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#source-controller

# Load into Docker
nix build .#load-source-controller-to-docker && ./result/bin/load-source-controller-to-docker
```
