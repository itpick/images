# mysql-fips

MySQL is a widely used open-source relational database management system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mysql-fips

# Load into Docker
nix build .#load-mysql-fips-to-docker && ./result/bin/load-mysql-fips-to-docker
```
