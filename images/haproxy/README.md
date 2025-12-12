# haproxy

A minimal haproxy base image rebuilt every night from source

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 95.48 MB |
| Uncompressed | ~238.70 MB |

## Usage

```bash
# Build the image
nix build .#haproxy

# Load into Docker
nix build .#load-haproxy-to-docker && ./result/bin/load-haproxy-to-docker
```
