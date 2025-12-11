# arangodb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#arangodb

# Load into Docker
nix build .#load-arangodb-to-docker && ./result/bin/load-arangodb-to-docker
```
