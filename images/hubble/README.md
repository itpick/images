# hubble

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 246.13 MB |
| Uncompressed | ~615.34 MB |

## Usage

```bash
# Build the image
nix build .#hubble

# Load into Docker
nix build .#load-hubble-to-docker && ./result/bin/load-hubble-to-docker
```
