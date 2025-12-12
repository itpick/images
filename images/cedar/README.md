# cedar

This image contains the CLI for the Cedar Policy Language. The binary can be used to run, test, format, or evaluate Cedar policies

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 132.52 MB |
| Uncompressed | ~331.30 MB |

## Usage

```bash
# Build the image
nix build .#cedar

# Load into Docker
nix build .#load-cedar-to-docker && ./result/bin/load-cedar-to-docker
```
