# ollama

## Image Size

| Type | Size |
|------|------|
| Compressed | 206.39 MB |
| Uncompressed | ~515.99 MB |

## Usage

```bash
# Build the image
nix build .#ollama

# Load into Docker
nix build .#load-ollama-to-docker && ./result/bin/load-ollama-to-docker
```
