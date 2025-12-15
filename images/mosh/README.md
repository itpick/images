# mosh

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mosh

# Load into Docker
nix build .#load-mosh-to-docker && ./result/bin/load-mosh-to-docker
```
