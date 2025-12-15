# wait-for-it

Container image for testing whether a service is listening on an address/port combination

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#wait-for-it

# Load into Docker
nix build .#load-wait-for-it-to-docker && ./result/bin/load-wait-for-it-to-docker
```
