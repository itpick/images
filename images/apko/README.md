# apko

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#apko

# Load into Docker
nix build .#load-apko-to-docker && ./result/bin/load-apko-to-docker
```
