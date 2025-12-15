# postgresql-15-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-15-client

# Load into Docker
nix build .#load-postgresql-15-client-to-docker && ./result/bin/load-postgresql-15-client-to-docker
```
