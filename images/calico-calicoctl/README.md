# calico-calicoctl

## Image Size

| Type | Size |
|------|------|
| Compressed | 198.87 MB |
| Uncompressed | ~497.19 MB |

## Usage

```bash
# Build the image
nix build .#calico-calicoctl

# Load into Docker
nix build .#load-calico-calicoctl-to-docker && ./result/bin/load-calico-calicoctl-to-docker
```
