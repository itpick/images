# harbor-fips-2.14-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-fips-2.14-exporter

# Load into Docker
nix build .#load-harbor-fips-2.14-exporter-to-docker && ./result/bin/load-harbor-fips-2.14-exporter-to-docker
```
