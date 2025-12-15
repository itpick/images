# rekor-backfill-index-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rekor-backfill-index-fips

# Load into Docker
nix build .#load-rekor-backfill-index-fips-to-docker && ./result/bin/load-rekor-backfill-index-fips-to-docker
```
