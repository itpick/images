# fluentd

Fluentd: Unified Logging Layer (project under CNCF)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 207.56 MB |
| Uncompressed | ~518.92 MB |

## Usage

```bash
# Build the image
nix build .#fluentd

# Load into Docker
nix build .#load-fluentd-to-docker && ./result/bin/load-fluentd-to-docker
```
