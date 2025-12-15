# kubelet-1.33-default

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubelet-1.33-default

# Load into Docker
nix build .#load-kubelet-1.33-default-to-docker && ./result/bin/load-kubelet-1.33-default-to-docker
```
