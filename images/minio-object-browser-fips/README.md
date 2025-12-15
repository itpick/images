# minio-object-browser-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-object-browser-fips

# Load into Docker
nix build .#load-minio-object-browser-fips-to-docker && ./result/bin/load-minio-object-browser-fips-to-docker
```
