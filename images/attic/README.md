# attic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#attic

# Load into Docker
nix build .#load-attic-to-docker && ./result/bin/load-attic-to-docker
```
