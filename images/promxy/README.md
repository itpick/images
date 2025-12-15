# promxy

Minimal image with Promxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#promxy

# Load into Docker
nix build .#load-promxy-to-docker && ./result/bin/load-promxy-to-docker
```
