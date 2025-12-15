# netshoot

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#netshoot

# Load into Docker
nix build .#load-netshoot-to-docker && ./result/bin/load-netshoot-to-docker
```
