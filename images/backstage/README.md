# backstage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#backstage

# Load into Docker
nix build .#load-backstage-to-docker && ./result/bin/load-backstage-to-docker
```
