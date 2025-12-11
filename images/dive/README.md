# dive

Minimal dive container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#dive

# Load into Docker
nix build .#load-dive-to-docker && ./result/bin/load-dive-to-docker
```
