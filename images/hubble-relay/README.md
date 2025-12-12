# hubble-relay

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 49s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 201.57 MB |
| Uncompressed | ~503.94 MB |

## Usage

```bash
# Build the image
nix build .#hubble-relay

# Load into Docker
nix build .#load-hubble-relay-to-docker && ./result/bin/load-hubble-relay-to-docker
```
