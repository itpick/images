# amazon-cloudwatch-agent

## Image Size

| Type | Size |
|------|------|
| Compressed | 483.50 MB |
| Uncompressed | ~1.18 GB |

## Usage

```bash
# Build the image
nix build .#amazon-cloudwatch-agent

# Load into Docker
nix build .#load-amazon-cloudwatch-agent-to-docker && ./result/bin/load-amazon-cloudwatch-agent-to-docker
```
