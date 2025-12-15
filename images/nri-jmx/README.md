# nri-jmx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-jmx

# Load into Docker
nix build .#load-nri-jmx-to-docker && ./result/bin/load-nri-jmx-to-docker
```
