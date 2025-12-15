# atlantis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#atlantis

# Load into Docker
nix build .#load-atlantis-to-docker && ./result/bin/load-atlantis-to-docker
```
