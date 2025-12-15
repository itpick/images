# nss-db

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nss-db

# Load into Docker
nix build .#load-nss-db-to-docker && ./result/bin/load-nss-db-to-docker
```
