# node-problem-detector

## Image Size

| Type | Size |
|------|------|
| Compressed | 221.93 MB |
| Uncompressed | ~554.84 MB |

## Usage

```bash
# Build the image
nix build .#node-problem-detector

# Load into Docker
nix build .#load-node-problem-detector-to-docker && ./result/bin/load-node-problem-detector-to-docker
```
