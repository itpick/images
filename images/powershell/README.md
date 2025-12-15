# powershell

Minimal Wolfi image with Powershell

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#powershell

# Load into Docker
nix build .#load-powershell-to-docker && ./result/bin/load-powershell-to-docker
```
