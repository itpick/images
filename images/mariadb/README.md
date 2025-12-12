# mariadb

MariaDB is one of the most popular open source relational databases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 811.12 MB |
| Uncompressed | ~1.98 GB |

## Usage

```bash
# Build the image
nix build .#mariadb

# Load into Docker
nix build .#load-mariadb-to-docker && ./result/bin/load-mariadb-to-docker
```
