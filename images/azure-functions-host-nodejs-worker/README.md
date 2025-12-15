# azure-functions-host-nodejs-worker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-functions-host-nodejs-worker

# Load into Docker
nix build .#load-azure-functions-host-nodejs-worker-to-docker && ./result/bin/load-azure-functions-host-nodejs-worker-to-docker
```
