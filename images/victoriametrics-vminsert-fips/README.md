# victoriametrics-vminsert-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#victoriametrics-vminsert-fips

# Load into Docker
nix build .#load-victoriametrics-vminsert-fips-to-docker && ./result/bin/load-victoriametrics-vminsert-fips-to-docker
```
