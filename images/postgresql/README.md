# postgresql

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql

# Load into Docker
nix build .#load-postgresql-to-docker && ./result/bin/load-postgresql-to-docker
```
