# lnav

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lnav

# Load into Docker
nix build .#load-lnav-to-docker && ./result/bin/load-lnav-to-docker
```
