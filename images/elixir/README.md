# elixir

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.32 GB |
| Uncompressed | ~5.81 GB |

## Usage

```bash
# Build the image
nix build .#elixir

# Load into Docker
nix build .#load-elixir-to-docker && ./result/bin/load-elixir-to-docker
```
