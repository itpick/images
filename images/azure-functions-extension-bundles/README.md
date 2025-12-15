# azure-functions-extension-bundles

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-functions-extension-bundles

# Load into Docker
nix build .#load-azure-functions-extension-bundles-to-docker && ./result/bin/load-azure-functions-extension-bundles-to-docker
```
