# pdns-5.2-recursor

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pdns-5.2-recursor

# Load into Docker
nix build .#load-pdns-5.2-recursor-to-docker && ./result/bin/load-pdns-5.2-recursor-to-docker
```
