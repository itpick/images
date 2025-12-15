# dogstatsd

Standalone DogStatsD image for custom metrics collection

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dogstatsd

# Load into Docker
nix build .#load-dogstatsd-to-docker && ./result/bin/load-dogstatsd-to-docker
```
