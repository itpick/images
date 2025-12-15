# valkey

Minimalist Wolfi-based Valkey image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#valkey

# Load into Docker
nix build .#load-valkey-to-docker && ./result/bin/load-valkey-to-docker
```
