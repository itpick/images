# mariadb

MariaDB is one of the most popular open source relational databases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#mariadb

# Load into Docker
nix build .#load-mariadb-to-docker && ./result/bin/load-mariadb-to-docker
```
