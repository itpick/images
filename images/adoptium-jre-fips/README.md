# adoptium-jre-fips

Minimalist Wolfi-based Java JRE image using Adoptium OpenJDK. Used for running Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#adoptium-jre-fips

# Load into Docker
nix build .#load-adoptium-jre-fips-to-docker && ./result/bin/load-adoptium-jre-fips-to-docker
```
