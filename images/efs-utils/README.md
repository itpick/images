# efs-utils

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#efs-utils

# Load into Docker
nix build .#load-efs-utils-to-docker && ./result/bin/load-efs-utils-to-docker
```
