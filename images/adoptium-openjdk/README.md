# adoptium-openjdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#adoptium-openjdk

# Load into Docker
nix build .#load-adoptium-openjdk-to-docker && ./result/bin/load-adoptium-openjdk-to-docker
```
