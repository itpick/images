# devcontainer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 19s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#devcontainer

# Load into Docker
nix build .#load-devcontainer-to-docker && ./result/bin/load-devcontainer-to-docker
```
