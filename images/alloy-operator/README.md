# alloy-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#alloy-operator

# Load into Docker
nix build .#load-alloy-operator-to-docker && ./result/bin/load-alloy-operator-to-docker
```
