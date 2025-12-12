# cilium-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 8s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 429.46 MB |
| Uncompressed | ~1.04 GB |

## Usage

```bash
# Build the image
nix build .#cilium-cli

# Load into Docker
nix build .#load-cilium-cli-to-docker && ./result/bin/load-cilium-cli-to-docker
```
