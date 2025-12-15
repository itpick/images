# azure-functions-host

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-functions-host

# Load into Docker
nix build .#load-azure-functions-host-to-docker && ./result/bin/load-azure-functions-host-to-docker
```
