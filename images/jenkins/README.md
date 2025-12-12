# jenkins

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.51 GB |
| Uncompressed | ~6.29 GB |

## Usage

```bash
# Build the image
nix build .#jenkins

# Load into Docker
nix build .#load-jenkins-to-docker && ./result/bin/load-jenkins-to-docker
```
