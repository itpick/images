# os-shell-nixchart

OS Shell + Utility is a general-purpose minimal image, used by Iamguarded Helm Charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#os-shell-nixchart

# Load into Docker
nix build .#load-os-shell-nixchart-to-docker && ./result/bin/load-os-shell-nixchart-to-docker
```
