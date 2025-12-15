# open-vmdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#open-vmdk

# Load into Docker
nix build .#load-open-vmdk-to-docker && ./result/bin/load-open-vmdk-to-docker
```
