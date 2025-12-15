# jaeger-2-fips-remote-storage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jaeger-2-fips-remote-storage

# Load into Docker
nix build .#load-jaeger-2-fips-remote-storage-to-docker && ./result/bin/load-jaeger-2-fips-remote-storage-to-docker
```
