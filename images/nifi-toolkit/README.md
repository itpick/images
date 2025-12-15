# nifi-toolkit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 11s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#nifi-toolkit

# Load into Docker
nix build .#load-nifi-toolkit-to-docker && ./result/bin/load-nifi-toolkit-to-docker
```
