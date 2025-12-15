# lsb-release-minimal

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lsb-release-minimal

# Load into Docker
nix build .#load-lsb-release-minimal-to-docker && ./result/bin/load-lsb-release-minimal-to-docker
```
