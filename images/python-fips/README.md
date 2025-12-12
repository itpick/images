# python-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 710.97 MB |
| Uncompressed | ~1.73 GB |

## Usage

```bash
# Build the image
nix build .#python-fips

# Load into Docker
nix build .#load-python-fips-to-docker && ./result/bin/load-python-fips-to-docker
```
