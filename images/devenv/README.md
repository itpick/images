# devenv

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#devenv

# Load into Docker
nix build .#load-devenv-to-docker && ./result/bin/load-devenv-to-docker
```
