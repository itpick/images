# enterprise-logs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 661.77 MB |
| Uncompressed | ~1.61 GB |

## Usage

```bash
# Build the image
nix build .#enterprise-logs

# Load into Docker
nix build .#load-enterprise-logs-to-docker && ./result/bin/load-enterprise-logs-to-docker
```
