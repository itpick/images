# alloy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#alloy

# Load into Docker
nix build .#load-alloy-to-docker && ./result/bin/load-alloy-to-docker
```
