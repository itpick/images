# step-kms-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#step-kms-plugin

# Load into Docker
nix build .#load-step-kms-plugin-to-docker && ./result/bin/load-step-kms-plugin-to-docker
```
