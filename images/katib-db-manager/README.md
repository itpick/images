# katib-db-manager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#katib-db-manager

# Load into Docker
nix build .#load-katib-db-manager-to-docker && ./result/bin/load-katib-db-manager-to-docker
```
