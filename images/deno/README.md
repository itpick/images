# deno

Minimal container image for running Deno apps

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 381.32 MB |
| Uncompressed | ~953.30 MB |

## Usage

```bash
# Build the image
nix build .#deno

# Load into Docker
nix build .#load-deno-to-docker && ./result/bin/load-deno-to-docker
```
