# nix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nix

# Load into Docker
nix build .#load-nix-to-docker && ./result/bin/load-nix-to-docker
```
