# knative-eventing-fips-1.19-mtchannel-broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-fips-1.19-mtchannel-broker

# Load into Docker
nix build .#load-knative-eventing-fips-1.19-mtchannel-broker-to-docker && ./result/bin/load-knative-eventing-fips-1.19-mtchannel-broker-to-docker
```
