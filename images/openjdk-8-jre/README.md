# openjdk-8-jre

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-8-jre

# Load into Docker
nix build .#load-openjdk-8-jre-to-docker && ./result/bin/load-openjdk-8-jre-to-docker
```
