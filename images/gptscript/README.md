# gptscript

## Image Size

| Type | Size |
|------|------|
| Compressed | 254.30 MB |
| Uncompressed | ~635.76 MB |

## Usage

```bash
# Build the image
nix build .#gptscript

# Load into Docker
nix build .#load-gptscript-to-docker && ./result/bin/load-gptscript-to-docker
```
