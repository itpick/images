# enterprise-logs-provisioner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 95.81 MB |
| Uncompressed | ~239.54 MB |

## Usage

```bash
# Build the image
nix build .#enterprise-logs-provisioner

# Load into Docker
nix build .#load-enterprise-logs-provisioner-to-docker && ./result/bin/load-enterprise-logs-provisioner-to-docker
```
