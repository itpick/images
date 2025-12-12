# google-cloud-sdk

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.10 GB |
| Uncompressed | ~2.76 GB |

## Usage

```bash
# Build the image
nix build .#google-cloud-sdk

# Load into Docker
nix build .#load-google-cloud-sdk-to-docker && ./result/bin/load-google-cloud-sdk-to-docker
```
