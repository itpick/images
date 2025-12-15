# spire

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spire

# Load into Docker
nix build .#load-spire-to-docker && ./result/bin/load-spire-to-docker
```
