# nri-postgresql

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-postgresql

# Load into Docker
nix build .#load-nri-postgresql-to-docker && ./result/bin/load-nri-postgresql-to-docker
```
