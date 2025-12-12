# hyperfine

## Image Size

| Type | Size |
|------|------|
| Compressed | 102.98 MB |
| Uncompressed | ~257.46 MB |

## Usage

```bash
# Build the image
nix build .#hyperfine

# Load into Docker
nix build .#load-hyperfine-to-docker && ./result/bin/load-hyperfine-to-docker
```
