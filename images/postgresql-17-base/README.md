# postgresql-17-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-17-base

# Load into Docker
nix build .#load-postgresql-17-base-to-docker && ./result/bin/load-postgresql-17-base-to-docker
```
