# mosquitto

## Image Size

| Type | Size |
|------|------|
| Compressed | 259.99 MB |
| Uncompressed | ~649.98 MB |

## Usage

```bash
# Build the image
nix build .#mosquitto

# Load into Docker
nix build .#load-mosquitto-to-docker && ./result/bin/load-mosquitto-to-docker
```
