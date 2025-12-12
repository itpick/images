# erlang

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.25 GB |
| Uncompressed | ~3.14 GB |

## Usage

```bash
# Build the image
nix build .#erlang

# Load into Docker
nix build .#load-erlang-to-docker && ./result/bin/load-erlang-to-docker
```
