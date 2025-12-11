# vector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 10s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#vector

# Load into Docker
nix build .#load-vector-to-docker && ./result/bin/load-vector-to-docker
```
