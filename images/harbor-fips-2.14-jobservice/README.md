# harbor-fips-2.14-jobservice

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-fips-2.14-jobservice

# Load into Docker
nix build .#load-harbor-fips-2.14-jobservice-to-docker && ./result/bin/load-harbor-fips-2.14-jobservice-to-docker
```
