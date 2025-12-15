# neuvector-registry-adapter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 10s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#neuvector-registry-adapter

# Load into Docker
nix build .#load-neuvector-registry-adapter-to-docker && ./result/bin/load-neuvector-registry-adapter-to-docker
```
