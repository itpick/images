# knative-eventing-fips-1.19-filter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-fips-1.19-filter

# Load into Docker
nix build .#load-knative-eventing-fips-1.19-filter-to-docker && ./result/bin/load-knative-eventing-fips-1.19-filter-to-docker
```
