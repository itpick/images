# calico-kube-controllers

## Image Size

| Type | Size |
|------|------|
| Compressed | 243.07 MB |
| Uncompressed | ~607.69 MB |

## Usage

```bash
# Build the image
nix build .#calico-kube-controllers

# Load into Docker
nix build .#load-calico-kube-controllers-to-docker && ./result/bin/load-calico-kube-controllers-to-docker
```
