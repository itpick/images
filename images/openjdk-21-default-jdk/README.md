# openjdk-21-default-jdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-21-default-jdk

# Load into Docker
nix build .#load-openjdk-21-default-jdk-to-docker && ./result/bin/load-openjdk-21-default-jdk-to-docker
```
