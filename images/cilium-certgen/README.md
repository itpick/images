# cilium-certgen

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-certgen

# Load into Docker
nix build .#load-cilium-certgen-to-docker && ./result/bin/load-cilium-certgen-to-docker
```
