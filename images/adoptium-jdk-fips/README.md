# adoptium-jdk-fips

Minimal Wolfi-based Java JDK image using Adoptium OpenJDK. Used for compiling Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#adoptium-jdk-fips

# Load into Docker
nix build .#load-adoptium-jdk-fips-to-docker && ./result/bin/load-adoptium-jdk-fips-to-docker
```
