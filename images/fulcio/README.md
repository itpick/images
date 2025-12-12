# fulcio

Last changed 2 days ago

FIPS available
Request a free trial

Contact our team to test out this image for free.

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 163.42 MB |
| Uncompressed | ~408.57 MB |

## Usage

```bash
# Build the image
nix build .#fulcio

# Load into Docker
nix build .#load-fulcio-to-docker && ./result/bin/load-fulcio-to-docker
```
