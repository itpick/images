# nextflow

## Image Size

| Type | Size |
|------|------|
| Compressed | 1013.16 MB |
| Uncompressed | ~2.47 GB |

## Usage

```bash
# Build the image
nix build .#nextflow

# Load into Docker
nix build .#load-nextflow-to-docker && ./result/bin/load-nextflow-to-docker
```
