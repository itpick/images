# minio-client-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-client-fips

# Load into Docker
nix build .#load-minio-client-fips-to-docker && ./result/bin/load-minio-client-fips-to-docker
```
