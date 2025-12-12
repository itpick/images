# ghidra

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.34 GB |
| Uncompressed | ~5.86 GB |

## Usage

```bash
# Build the image
nix build .#ghidra

# Load into Docker
nix build .#load-ghidra-to-docker && ./result/bin/load-ghidra-to-docker
```
