# openjdk-21-jre

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-21-jre

# Load into Docker
nix build .#load-openjdk-21-jre-to-docker && ./result/bin/load-openjdk-21-jre-to-docker
```
