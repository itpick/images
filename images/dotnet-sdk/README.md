# dotnet-sdk

## Image Size

| Type | Size |
|------|------|
| Compressed | 835.43 MB |
| Uncompressed | ~2.03 GB |

## Usage

```bash
# Build the image
nix build .#dotnet-sdk

# Load into Docker
nix build .#load-dotnet-sdk-to-docker && ./result/bin/load-dotnet-sdk-to-docker
```
