# hubble-certgen

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 33s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 127.33 MB |
| Uncompressed | ~318.34 MB |

## Usage

```bash
# Build the image
nix build .#hubble-certgen

# Load into Docker
nix build .#load-hubble-certgen-to-docker && ./result/bin/load-hubble-certgen-to-docker
```
