# rekor-backfill-index

Rekor is one of the core components of the sigstore stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rekor-backfill-index

# Load into Docker
nix build .#load-rekor-backfill-index-to-docker && ./result/bin/load-rekor-backfill-index-to-docker
```
