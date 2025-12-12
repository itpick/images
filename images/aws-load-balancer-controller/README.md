# aws-load-balancer-controller

## Image Size

| Type | Size |
|------|------|
| Compressed | 206.58 MB |
| Uncompressed | ~516.47 MB |

## Usage

```bash
# Build the image
nix build .#aws-load-balancer-controller

# Load into Docker
nix build .#load-aws-load-balancer-controller-to-docker && ./result/bin/load-aws-load-balancer-controller-to-docker
```
