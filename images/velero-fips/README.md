# velero-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#velero-fips

# Load into Docker
nix build .#load-velero-fips-to-docker && ./result/bin/load-velero-fips-to-docker
```
