# sd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sd

# Load into Docker
nix build .#load-sd-to-docker && ./result/bin/load-sd-to-docker
```
