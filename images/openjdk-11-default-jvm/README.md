# openjdk-11-default-jvm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-11-default-jvm

# Load into Docker
nix build .#load-openjdk-11-default-jvm-to-docker && ./result/bin/load-openjdk-11-default-jvm-to-docker
```
