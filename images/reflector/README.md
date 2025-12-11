# reflector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#reflector

# Load into Docker
nix build .#load-reflector-to-docker && ./result/bin/load-reflector-to-docker
```
