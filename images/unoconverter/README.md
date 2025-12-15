# unoconverter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#unoconverter

# Load into Docker
nix build .#load-unoconverter-to-docker && ./result/bin/load-unoconverter-to-docker
```
