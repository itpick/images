# openjdk-crac

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-crac

# Load into Docker
nix build .#load-openjdk-crac-to-docker && ./result/bin/load-openjdk-crac-to-docker
```
