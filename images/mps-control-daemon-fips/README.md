# mps-control-daemon-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mps-control-daemon-fips

# Load into Docker
nix build .#load-mps-control-daemon-fips-to-docker && ./result/bin/load-mps-control-daemon-fips-to-docker
```
