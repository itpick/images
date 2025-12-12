# mysql

MySQL is a widely used open-source relational database management system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 8s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 814.26 MB |
| Uncompressed | ~1.98 GB |

## Usage

```bash
# Build the image
nix build .#mysql

# Load into Docker
nix build .#load-mysql-to-docker && ./result/bin/load-mysql-to-docker
```
