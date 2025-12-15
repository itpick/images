# postgresql-14-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-14-base

# Load into Docker
nix build .#load-postgresql-14-base-to-docker && ./result/bin/load-postgresql-14-base-to-docker
```
