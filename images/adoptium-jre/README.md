# adoptium-jre

Minimalist Wolfi-based Java JRE image using Adoptium. Used for running Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#adoptium-jre

# Load into Docker
nix build .#load-adoptium-jre-to-docker && ./result/bin/load-adoptium-jre-to-docker
```
