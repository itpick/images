# open-webui

## Image Size

| Type | Size |
|------|------|
| Compressed | 5.43 GB |
| Uncompressed | ~13.59 GB |

## Usage

```bash
# Build the image
nix build .#open-webui

# Load into Docker
nix build .#load-open-webui-to-docker && ./result/bin/load-open-webui-to-docker
```
