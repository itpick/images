# etcd-nixchart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#etcd-nixchart

# Load into Docker
nix build .#load-etcd-nixchart-to-docker && ./result/bin/load-etcd-nixchart-to-docker
```
