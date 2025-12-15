# electric

Real-time sync for Postgres

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#electric

# Load into Docker
nix build .#load-electric-to-docker && ./result/bin/load-electric-to-docker
```
