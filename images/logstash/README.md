# logstash

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.15 GB |
| Uncompressed | ~2.89 GB |

## Usage

```bash
# Build the image
nix build .#logstash

# Load into Docker
nix build .#load-logstash-to-docker && ./result/bin/load-logstash-to-docker
```
