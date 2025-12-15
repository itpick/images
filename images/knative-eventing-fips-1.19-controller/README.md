# knative-eventing-fips-1.19-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-fips-1.19-controller

# Load into Docker
nix build .#load-knative-eventing-fips-1.19-controller-to-docker && ./result/bin/load-knative-eventing-fips-1.19-controller-to-docker
```
