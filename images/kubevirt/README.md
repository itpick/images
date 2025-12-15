# kubevirt

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubevirt

# Load into Docker
nix build .#load-kubevirt-to-docker && ./result/bin/load-kubevirt-to-docker
```
