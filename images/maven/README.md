# maven

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.71 GB |
| Uncompressed | ~4.27 GB |

## Usage

```bash
# Build the image
nix build .#maven

# Load into Docker
nix build .#load-maven-to-docker && ./result/bin/load-maven-to-docker
```
