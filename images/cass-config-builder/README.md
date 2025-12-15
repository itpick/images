# cass-config-builder

Minimal cass-config-builder container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cass-config-builder

# Load into Docker
nix build .#load-cass-config-builder-to-docker && ./result/bin/load-cass-config-builder-to-docker
```
