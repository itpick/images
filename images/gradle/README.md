# gradle

Chainguard Image with Gradle, an open source build system for Java, Android, and Kotlin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 13s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.56 GB |
| Uncompressed | ~3.90 GB |

## Usage

```bash
# Build the image
nix build .#gradle

# Load into Docker
nix build .#load-gradle-to-docker && ./result/bin/load-gradle-to-docker
```
