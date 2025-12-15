# postgresql-15-contrib

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-15-contrib

# Load into Docker
nix build .#load-postgresql-15-contrib-to-docker && ./result/bin/load-postgresql-15-contrib-to-docker
```
