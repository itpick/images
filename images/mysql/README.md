# mysql

MySQL is a widely used open-source relational database management system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#mysql

# Load into Docker
nix build .#load-mysql-to-docker && ./result/bin/load-mysql-to-docker
```
