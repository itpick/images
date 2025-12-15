# packer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#packer

# Load into Docker
nix build .#load-packer-to-docker && ./result/bin/load-packer-to-docker
```
