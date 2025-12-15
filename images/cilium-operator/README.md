# cilium-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cilium-operator

# Load into Docker
nix build .#load-cilium-operator-to-docker && ./result/bin/load-cilium-operator-to-docker
```
