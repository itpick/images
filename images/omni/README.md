# omni

Omni managing Kubernetes clusters across bare metal, VMs, and cloud

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#omni

# Load into Docker
nix build .#load-omni-to-docker && ./result/bin/load-omni-to-docker
```
