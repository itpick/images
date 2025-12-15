# prometheus-pushgateway-iamguarded-fips

Push acceptor for ephemeral and batch jobs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-pushgateway-iamguarded-fips

# Load into Docker
nix build .#load-prometheus-pushgateway-iamguarded-fips-to-docker && ./result/bin/load-prometheus-pushgateway-iamguarded-fips-to-docker
```
