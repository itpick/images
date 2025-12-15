# mig-parted

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mig-parted

# Load into Docker
nix build .#load-mig-parted-to-docker && ./result/bin/load-mig-parted-to-docker
```
