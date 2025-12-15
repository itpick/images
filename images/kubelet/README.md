# kubelet

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubelet

# Load into Docker
nix build .#load-kubelet-to-docker && ./result/bin/load-kubelet-to-docker
```
