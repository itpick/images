# consul

Minimal image with Consul

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 431.02 MB |
| Uncompressed | ~1.05 GB |

## Usage

```bash
# Build the image
nix build .#consul

# Load into Docker
nix build .#load-consul-to-docker && ./result/bin/load-consul-to-docker
```
