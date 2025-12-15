# ko

Minimal image to build and deploy Go applications using ko

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#ko

# Load into Docker
nix build .#load-ko-to-docker && ./result/bin/load-ko-to-docker
```
