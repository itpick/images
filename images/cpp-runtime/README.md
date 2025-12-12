# cpp-runtime

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 82.73 MB |
| Uncompressed | ~206.83 MB |

## Usage

```bash
# Build the image
nix build .#cpp-runtime

# Load into Docker
nix build .#load-cpp-runtime-to-docker && ./result/bin/load-cpp-runtime-to-docker
```
