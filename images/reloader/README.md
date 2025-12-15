# reloader

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#reloader

# Load into Docker
nix build .#load-reloader-to-docker && ./result/bin/load-reloader-to-docker
```
