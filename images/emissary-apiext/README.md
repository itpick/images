# emissary-apiext

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#emissary-apiext

# Load into Docker
nix build .#load-emissary-apiext-to-docker && ./result/bin/load-emissary-apiext-to-docker
```
