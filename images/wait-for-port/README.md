# wait-for-port

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wait-for-port

# Load into Docker
nix build .#load-wait-for-port-to-docker && ./result/bin/load-wait-for-port-to-docker
```
