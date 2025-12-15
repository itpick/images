# openjdk-crac-25-jre-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-crac-25-jre-base

# Load into Docker
nix build .#load-openjdk-crac-25-jre-base-to-docker && ./result/bin/load-openjdk-crac-25-jre-base-to-docker
```
