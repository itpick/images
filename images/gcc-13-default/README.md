# gcc-13-default

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gcc-13-default

# Load into Docker
nix build .#load-gcc-13-default-to-docker && ./result/bin/load-gcc-13-default-to-docker
```
