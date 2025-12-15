# yq

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#yq

# Load into Docker
nix build .#load-yq-to-docker && ./result/bin/load-yq-to-docker
```
