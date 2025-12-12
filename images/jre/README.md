# jre

Minimalist Wolfi-based Java JRE image using OpenJDK. Used for running Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 628.78 MB |
| Uncompressed | ~1.53 GB |

## Usage

```bash
# Build the image
nix build .#jre

# Load into Docker
nix build .#load-jre-to-docker && ./result/bin/load-jre-to-docker
```
