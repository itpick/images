# keda-fips-2.18-metrics-apiserver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keda-fips-2.18-metrics-apiserver

# Load into Docker
nix build .#load-keda-fips-2.18-metrics-apiserver-to-docker && ./result/bin/load-keda-fips-2.18-metrics-apiserver-to-docker
```
