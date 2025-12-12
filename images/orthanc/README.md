# orthanc

## Image Size

| Type | Size |
|------|------|
| Compressed | 881.10 MB |
| Uncompressed | ~2.15 GB |

## Usage

```bash
# Build the image
nix build .#orthanc

# Load into Docker
nix build .#load-orthanc-to-docker && ./result/bin/load-orthanc-to-docker
```
