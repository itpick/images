# rekor-fips-backfill-index

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rekor-fips-backfill-index

# Load into Docker
nix build .#load-rekor-fips-backfill-index-to-docker && ./result/bin/load-rekor-fips-backfill-index-to-docker
```
