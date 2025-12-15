# openjdk-8-openj9

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-8-openj9

# Load into Docker
nix build .#load-openjdk-8-openj9-to-docker && ./result/bin/load-openjdk-8-openj9-to-docker
```
