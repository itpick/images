# boundary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 14s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#boundary

# Load into Docker
nix build .#load-boundary-to-docker && ./result/bin/load-boundary-to-docker
```
