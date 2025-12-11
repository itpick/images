# enterprise-logs-provisioner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#enterprise-logs-provisioner

# Load into Docker
nix build .#load-enterprise-logs-provisioner-to-docker && ./result/bin/load-enterprise-logs-provisioner-to-docker
```
