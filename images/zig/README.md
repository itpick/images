# zig

Minimal image with zig binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 13s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#zig

# Load into Docker
nix build .#load-zig-to-docker && ./result/bin/load-zig-to-docker
```
