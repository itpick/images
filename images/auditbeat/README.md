# auditbeat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 276.40 MB |
| Uncompressed | ~691.00 MB |

## Usage

```bash
# Build the image
nix build .#auditbeat

# Load into Docker
nix build .#load-auditbeat-to-docker && ./result/bin/load-auditbeat-to-docker
```
