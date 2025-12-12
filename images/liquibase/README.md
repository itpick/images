# liquibase

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.50 GB |
| Uncompressed | ~3.75 GB |

## Usage

```bash
# Build the image
nix build .#liquibase

# Load into Docker
nix build .#load-liquibase-to-docker && ./result/bin/load-liquibase-to-docker
```
