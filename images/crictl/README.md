# crictl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crictl

# Load into Docker
nix build .#load-crictl-to-docker && ./result/bin/load-crictl-to-docker
```
