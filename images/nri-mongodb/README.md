# nri-mongodb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-mongodb

# Load into Docker
nix build .#load-nri-mongodb-to-docker && ./result/bin/load-nri-mongodb-to-docker
```
