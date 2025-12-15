# authentik

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#authentik

# Load into Docker
nix build .#load-authentik-to-docker && ./result/bin/load-authentik-to-docker
```
