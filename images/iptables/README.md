# iptables

## Image Size

| Type | Size |
|------|------|
| Compressed | 118.94 MB |
| Uncompressed | ~297.35 MB |

## Usage

```bash
# Build the image
nix build .#iptables

# Load into Docker
nix build .#load-iptables-to-docker && ./result/bin/load-iptables-to-docker
```
