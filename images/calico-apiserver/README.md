# calico-apiserver

## Image Size

| Type | Size |
|------|------|
| Compressed | 238.16 MB |
| Uncompressed | ~595.41 MB |

## Usage

```bash
# Build the image
nix build .#calico-apiserver

# Load into Docker
nix build .#load-calico-apiserver-to-docker && ./result/bin/load-calico-apiserver-to-docker
```
