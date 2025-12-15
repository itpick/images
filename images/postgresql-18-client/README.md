# postgresql-18-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgresql-18-client

# Load into Docker
nix build .#load-postgresql-18-client-to-docker && ./result/bin/load-postgresql-18-client-to-docker
```
