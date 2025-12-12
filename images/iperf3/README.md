# iperf3

## Image Size

| Type | Size |
|------|------|
| Compressed | 104.43 MB |
| Uncompressed | ~261.08 MB |

## Usage

```bash
# Build the image
nix build .#iperf3

# Load into Docker
nix build .#load-iperf3-to-docker && ./result/bin/load-iperf3-to-docker
```
