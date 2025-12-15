# miller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#miller

# Load into Docker
nix build .#load-miller-to-docker && ./result/bin/load-miller-to-docker
```
