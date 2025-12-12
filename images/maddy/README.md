# maddy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 113.33 MB |
| Uncompressed | ~283.34 MB |

## Usage

```bash
# Build the image
nix build .#maddy

# Load into Docker
nix build .#load-maddy-to-docker && ./result/bin/load-maddy-to-docker
```
