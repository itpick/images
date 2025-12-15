# hwdata-pci

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hwdata-pci

# Load into Docker
nix build .#load-hwdata-pci-to-docker && ./result/bin/load-hwdata-pci-to-docker
```
