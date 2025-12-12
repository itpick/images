# cpp-build-env

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 10s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 475.36 MB |
| Uncompressed | ~1.16 GB |

## Usage

```bash
# Build the image
nix build .#cpp-build-env

# Load into Docker
nix build .#load-cpp-build-env-to-docker && ./result/bin/load-cpp-build-env-to-docker
```
