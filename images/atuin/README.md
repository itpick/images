# atuin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#atuin

# Load into Docker
nix build .#load-atuin-to-docker && ./result/bin/load-atuin-to-docker
```
