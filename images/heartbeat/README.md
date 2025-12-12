# heartbeat

## Image Size

| Type | Size |
|------|------|
| Compressed | 248.77 MB |
| Uncompressed | ~621.93 MB |

## Usage

```bash
# Build the image
nix build .#heartbeat

# Load into Docker
nix build .#load-heartbeat-to-docker && ./result/bin/load-heartbeat-to-docker
```
