# cachix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cachix

# Load into Docker
nix build .#load-cachix-to-docker && ./result/bin/load-cachix-to-docker
```
