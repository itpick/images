# loki-fips-3.6-loki-canary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#loki-fips-3.6-loki-canary

# Load into Docker
nix build .#load-loki-fips-3.6-loki-canary-to-docker && ./result/bin/load-loki-fips-3.6-loki-canary-to-docker
```
