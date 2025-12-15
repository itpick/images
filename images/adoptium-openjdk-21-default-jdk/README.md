# adoptium-openjdk-21-default-jdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#adoptium-openjdk-21-default-jdk

# Load into Docker
nix build .#load-adoptium-openjdk-21-default-jdk-to-docker && ./result/bin/load-adoptium-openjdk-21-default-jdk-to-docker
```
