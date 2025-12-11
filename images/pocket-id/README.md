# pocket-id

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#pocket-id

# Load into Docker
nix build .#load-pocket-id-to-docker && ./result/bin/load-pocket-id-to-docker
```
