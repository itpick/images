# grype-db

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grype-db

# Load into Docker
nix build .#load-grype-db-to-docker && ./result/bin/load-grype-db-to-docker
```
