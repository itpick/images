# dataplaneapi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dataplaneapi

# Load into Docker
nix build .#load-dataplaneapi-to-docker && ./result/bin/load-dataplaneapi-to-docker
```
