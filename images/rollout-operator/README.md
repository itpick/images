# rollout-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#rollout-operator

# Load into Docker
nix build .#load-rollout-operator-to-docker && ./result/bin/load-rollout-operator-to-docker
```
