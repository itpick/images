# postgresql-17-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-17-client

# Load into Docker
nix build .#load-postgresql-17-client-to-docker && ./result/bin/load-postgresql-17-client-to-docker
```
