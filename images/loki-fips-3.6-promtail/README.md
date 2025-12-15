# loki-fips-3.6-promtail

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#loki-fips-3.6-promtail

# Load into Docker
nix build .#load-loki-fips-3.6-promtail-to-docker && ./result/bin/load-loki-fips-3.6-promtail-to-docker
```
