# anchore-enterprise

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#anchore-enterprise

# Load into Docker
nix build .#load-anchore-enterprise-to-docker && ./result/bin/load-anchore-enterprise-to-docker
```
