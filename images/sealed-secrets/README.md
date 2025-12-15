# sealed-secrets

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sealed-secrets

# Load into Docker
nix build .#load-sealed-secrets-to-docker && ./result/bin/load-sealed-secrets-to-docker
```
