# dependency-track-bundled

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dependency-track-bundled

# Load into Docker
nix build .#load-dependency-track-bundled-to-docker && ./result/bin/load-dependency-track-bundled-to-docker
```
