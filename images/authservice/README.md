# authservice

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#authservice

# Load into Docker
nix build .#load-authservice-to-docker && ./result/bin/load-authservice-to-docker
```
