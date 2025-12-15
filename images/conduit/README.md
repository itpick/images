# conduit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#conduit

# Load into Docker
nix build .#load-conduit-to-docker && ./result/bin/load-conduit-to-docker
```
