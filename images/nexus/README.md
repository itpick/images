# nexus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#nexus

# Load into Docker
nix build .#load-nexus-to-docker && ./result/bin/load-nexus-to-docker
```
