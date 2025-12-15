# netdata

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#netdata

# Load into Docker
nix build .#load-netdata-to-docker && ./result/bin/load-netdata-to-docker
```
