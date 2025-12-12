# percona-server

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.42 GB |
| Uncompressed | ~3.57 GB |

## Usage

```bash
# Build the image
nix build .#percona-server

# Load into Docker
nix build .#load-percona-server-to-docker && ./result/bin/load-percona-server-to-docker
```
