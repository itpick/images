# volsync-fips

Asynchronous data replication for Kubernetes volumes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#volsync-fips

# Load into Docker
nix build .#load-volsync-fips-to-docker && ./result/bin/load-volsync-fips-to-docker
```
