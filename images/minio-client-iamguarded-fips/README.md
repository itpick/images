# minio-client-iamguarded-fips

MinIO is a high-performance, S3 compatible object store. This FIPS-compliant iamguarded variant is specifically designed to work with the iamguarded Helm chart in FIPS-140 compliant environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#minio-client-iamguarded-fips

# Load into Docker
nix build .#load-minio-client-iamguarded-fips-to-docker && ./result/bin/load-minio-client-iamguarded-fips-to-docker
```
