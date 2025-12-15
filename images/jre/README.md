# jre

Minimalist Wolfi-based Java JRE image using OpenJDK. Used for running Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#jre

# Load into Docker
nix build .#load-jre-to-docker && ./result/bin/load-jre-to-docker
```
