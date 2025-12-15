# melange

Container image for running melange workflows to build APK packages

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#melange

# Load into Docker
nix build .#load-melange-to-docker && ./result/bin/load-melange-to-docker
```
