# jaeger-remote-storage-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-remote-storage-fips

# Load into Docker
nix build .#load-jaeger-remote-storage-fips-to-docker && ./result/bin/load-jaeger-remote-storage-fips-to-docker
```
