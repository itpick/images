# aws-cli

## Image Size

| Type | Size |
|------|------|
| Compressed | 572.91 MB |
| Uncompressed | ~1.39 GB |

## Usage

```bash
# Build the image
nix build .#aws-cli

# Load into Docker
nix build .#load-aws-cli-to-docker && ./result/bin/load-aws-cli-to-docker
```
