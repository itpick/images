# nri-nagios

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-nagios

# Load into Docker
nix build .#load-nri-nagios-to-docker && ./result/bin/load-nri-nagios-to-docker
```
