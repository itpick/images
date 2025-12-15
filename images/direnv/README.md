# direnv

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#direnv

# Load into Docker
nix build .#load-direnv-to-docker && ./result/bin/load-direnv-to-docker
```
