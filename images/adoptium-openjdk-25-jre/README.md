# adoptium-openjdk-25-jre

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#adoptium-openjdk-25-jre

# Load into Docker
nix build .#load-adoptium-openjdk-25-jre-to-docker && ./result/bin/load-adoptium-openjdk-25-jre-to-docker
```
