# plugin-barman-cloud-sidecar

CloudNativePG barman-cloud plugin for PostgreSQL backup and recovery to S3-compatible storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#plugin-barman-cloud-sidecar

# Load into Docker
nix build .#load-plugin-barman-cloud-sidecar-to-docker && ./result/bin/load-plugin-barman-cloud-sidecar-to-docker
```
