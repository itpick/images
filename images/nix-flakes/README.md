# nix-flakes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nix-flakes

# Load into Docker
nix build .#load-nix-flakes-to-docker && ./result/bin/load-nix-flakes-to-docker
```
