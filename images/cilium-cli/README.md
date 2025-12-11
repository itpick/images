# cilium-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 8s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cilium-cli

# Load into Docker
nix build .#load-cilium-cli-to-docker && ./result/bin/load-cilium-cli-to-docker
```
