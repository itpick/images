# netstandard-8-targeting-pack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#netstandard-8-targeting-pack

# Load into Docker
nix build .#load-netstandard-8-targeting-pack-to-docker && ./result/bin/load-netstandard-8-targeting-pack-to-docker
```
