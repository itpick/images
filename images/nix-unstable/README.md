# nix-unstable

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nix-unstable

# Load into Docker
nix build .#load-nix-unstable-to-docker && ./result/bin/load-nix-unstable-to-docker
```
