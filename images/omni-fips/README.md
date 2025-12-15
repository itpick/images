# omni-fips

Omni managing Kubernetes clusters across bare metal, VMs, and cloud

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#omni-fips

# Load into Docker
nix build .#load-omni-fips-to-docker && ./result/bin/load-omni-fips-to-docker
```
