# just

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#just

# Load into Docker
nix build .#load-just-to-docker && ./result/bin/load-just-to-docker
```
