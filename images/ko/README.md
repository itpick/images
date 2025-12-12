# ko

Minimal image to build and deploy Go applications using ko

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 598.47 MB |
| Uncompressed | ~1.46 GB |

## Usage

```bash
# Build the image
nix build .#ko

# Load into Docker
nix build .#load-ko-to-docker && ./result/bin/load-ko-to-docker
```
