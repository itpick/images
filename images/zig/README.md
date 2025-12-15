# zig

Minimal image with zig binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zig

# Load into Docker
nix build .#load-zig-to-docker && ./result/bin/load-zig-to-docker
```
