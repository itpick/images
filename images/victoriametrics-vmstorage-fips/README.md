# victoriametrics-vmstorage-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#victoriametrics-vmstorage-fips

# Load into Docker
nix build .#load-victoriametrics-vmstorage-fips-to-docker && ./result/bin/load-victoriametrics-vmstorage-fips-to-docker
```
