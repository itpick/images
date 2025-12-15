# mimir

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#mimir

# Load into Docker
nix build .#load-mimir-to-docker && ./result/bin/load-mimir-to-docker
```
