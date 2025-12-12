# jdk

Minimal Wolfi-based Java JDK image using OpenJDK. Used for compiling Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 9s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.16 GB |
| Uncompressed | ~2.90 GB |

## Usage

```bash
# Build the image
nix build .#jdk

# Load into Docker
nix build .#load-jdk-to-docker && ./result/bin/load-jdk-to-docker
```
