# azure-functions-host-python3.13-worker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-functions-host-python3.13-worker

# Load into Docker
nix build .#load-azure-functions-host-python3.13-worker-to-docker && ./result/bin/load-azure-functions-host-python3.13-worker-to-docker
```
