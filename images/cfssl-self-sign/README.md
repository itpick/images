# cfssl-self-sign

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 166.81 MB |
| Uncompressed | ~417.03 MB |

## Usage

```bash
# Build the image
nix build .#cfssl-self-sign

# Load into Docker
nix build .#load-cfssl-self-sign-to-docker && ./result/bin/load-cfssl-self-sign-to-docker
```
